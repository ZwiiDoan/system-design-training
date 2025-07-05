variable "aws_region" {
  description = "AWS region to use."
  type        = string
  default     = "ap-southeast-2"
}

variable "aws_profile" {
  description = "AWS CLI profile name for the bootstrap admin user."
  type        = string
  default     = "default"
}
