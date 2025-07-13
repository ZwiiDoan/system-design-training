output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}

output "alb_security_group_id" {
  description = "ID of the ALB's security group"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.web_tg.arn
}

output "instance_security_group_id" {
  description = "ID of the instance security group"
  value       = aws_security_group.ec2.id
}
