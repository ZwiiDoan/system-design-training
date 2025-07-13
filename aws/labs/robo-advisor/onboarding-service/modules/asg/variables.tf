variable "vpc_id" {
  description = "VPC ID for the ASG"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the ASG instances"
  type        = list(string)
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
}

variable "instance_type" {
  description = "EC2 instance type for the launch template"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB Target Group to attach to the ASG"
  type        = string
}

variable "instance_security_group_id" {
  description = "ID of the security group for the EC2 instances"
  type        = string
}
