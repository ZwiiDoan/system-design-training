variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-2"
}

variable "app_name" {
  description = "Name for the ECS app"
  type        = string
  default     = "portfolio-sim-api"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}