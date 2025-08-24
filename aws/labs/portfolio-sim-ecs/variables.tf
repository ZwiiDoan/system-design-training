variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "portfolio-sim-api"
}
