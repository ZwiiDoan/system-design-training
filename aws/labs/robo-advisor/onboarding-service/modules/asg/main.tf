

# IAM Role and Instance Profile
resource "aws_iam_role" "ec2_ssm" {
  name = "robo-advisor-ec2-ssm-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
  tags = var.default_tags
}

resource "aws_iam_role_policy" "ssm_read_only" {
  name = "robo-advisor-ssm-read-only"
  role = aws_iam_role.ec2_ssm.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["ssm:GetParameter", "ssm:GetParameters", "ssm:GetParametersByPath"]
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_ssm" {
  name = "robo-advisor-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm.name
  tags = var.default_tags
}



data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_launch_template" "web_lt" {
  name_prefix   = "robo-advisor-web-lt-"
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_ssm.name
  }
  user_data = base64encode(<<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx

    # Create a custom Nginx configuration
    cat > /etc/nginx/conf.d/custom.conf <<CONF
    server {
        listen 3000;
        server_name _;

        location / {
            root /usr/share/nginx/html;
            index index.html;
            try_files \$uri \$uri/ =404;
        }

        location /health {
            return 200 "OK";
            add_header Content-Type text/plain;
        }
    }
    CONF

    # Set the main page content
    echo "Hello, Robo-Advisor from $(hostname)!" > /usr/share/nginx/html/index.html

    # Restart Nginx to apply the new configuration
    systemctl restart nginx
    systemctl enable nginx
  EOF
  )
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }
  vpc_security_group_ids = [var.instance_security_group_id]
  tags                   = var.default_tags
}

resource "aws_autoscaling_group" "web_asg" {
  name                = "robo-advisor-asg"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  vpc_zone_identifier = var.private_subnets
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 60

  tag {
    key                 = "Name"
    value               = "robo-advisor-asg-instance"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = var.default_tags["Project"]
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = var.default_tags["Environment"]
    propagate_at_launch = true
  }
  tag {
    key                 = "Owner"
    value               = var.default_tags["Owner"]
    propagate_at_launch = true
  }
  tag {
    key                 = "ManagedBy"
    value               = var.default_tags["ManagedBy"]
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                      = "scale-out-policy"
  autoscaling_group_name    = aws_autoscaling_group.web_asg.name
  adjustment_type           = "ChangeInCapacity"
  scaling_adjustment        = 1
  cooldown                  = 300
  estimated_instance_warmup = 60
}

resource "aws_autoscaling_policy" "scale_in" {
  name                      = "scale-in-policy"
  autoscaling_group_name    = aws_autoscaling_group.web_asg.name
  adjustment_type           = "ChangeInCapacity"
  scaling_adjustment        = -1
  cooldown                  = 600
  estimated_instance_warmup = 60
}

# Target tracking scaling policy (recommended)
resource "aws_autoscaling_policy" "target_tracking" {
  name                      = "target-tracking-policy"
  autoscaling_group_name    = aws_autoscaling_group.web_asg.name
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 60
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
    }
    target_value = 50
  }
  # See: https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html?utm_source=chatgpt.com
}

# Step scaling policy (optional, for snappier CPU burst response)
resource "aws_autoscaling_policy" "step_scaling" {
  name                   = "step-scaling-policy"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  policy_type            = "StepScaling"
  adjustment_type        = "ChangeInCapacity"
  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = 0
    metric_interval_upper_bound = 100
  }
  cooldown                  = 300
  estimated_instance_warmup = 60
  # Triggered by CloudWatch alarm for CPUUtilization > 70% (see alarm below)
}

# Predictive scaling policy (stretch goal)
resource "aws_autoscaling_policy" "predictive_scaling" {
  name                   = "predictive-scaling-policy"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_metric_pair_specification {
        predefined_metric_type = "ALBRequestCount"
      }
    }
    mode = "ForecastAndScale"
  }
  # See: https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html?utm_source=chatgpt.com
  # See: https://awsforengineers.com/blog/predictive-scaling-for-ec2-auto-scaling/?utm_source=chatgpt.com
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_actions       = [aws_autoscaling_policy.scale_out.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}

# Step scaling alarm for CPU > 70% (triggers step_scaling policy)
resource "aws_cloudwatch_metric_alarm" "cpu_step_high" {
  alarm_name          = "cpu-step-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_actions       = [aws_autoscaling_policy.step_scaling.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 600
  statistic           = "Average"
  threshold           = 20
  alarm_actions       = [aws_autoscaling_policy.scale_in.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}


