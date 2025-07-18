variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "ap-southeast-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for static site."
  type        = string
  default     = "robo-static-site"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "custom_domain" {
  description = "Custom domain name for CloudFront (e.g., www.example.com). Leave null to use default CloudFront domain."
  type        = string
  default     = null
}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID for DNS validation. Required if using custom_domain."
  type        = string
  default     = null
}
