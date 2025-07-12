data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
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
  name_prefix   = "web-lt-v1-"
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }
}

# To create a new version with Amazon Linux 2023, update image_id to data.aws_ami.amazon_linux_2023.id and re-apply, or use the AWS CLI to create a new version manually.
