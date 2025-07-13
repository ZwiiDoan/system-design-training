output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.name
}

output "launch_template_id" {
  description = "ID of the Launch Template used by the ASG"
  value       = aws_launch_template.web_lt.id
}
