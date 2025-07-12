output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.asg.asg_name
}

output "launch_template_id" {
  description = "ID of the Launch Template used by ASG"
  value       = module.asg.launch_template_id
}

output "onboarding_url" {
  description = "Public URL for the onboarding service"
  value       = "http://${module.alb.alb_dns_name}"
}
