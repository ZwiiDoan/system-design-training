output "app_url" {
  description = "URL of the portfolio simulator API"
  value       = "http://${aws_lb.main.dns_name}"
}