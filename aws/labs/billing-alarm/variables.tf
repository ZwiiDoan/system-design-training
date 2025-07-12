variable "aws_region" {
  description = "AWS region to use. Billing data is only available in us-east-1."
  type        = string
  default     = "us-east-1"
}

variable "budget_amount" {
  description = "Monthly budget amount in USD."
  type        = string
  default     = "10"
}

variable "notification_email" {
  description = "Email address to notify when budget is exceeded."
  type        = string
}
