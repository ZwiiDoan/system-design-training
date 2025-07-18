variable "aws_region" {
  description = "The AWS region to deploy resources in."
  default     = "ap-southeast-2"
}

variable "user_name" {
  description = "The name of the IAM user to create."
  default     = "terraform-user"
}
