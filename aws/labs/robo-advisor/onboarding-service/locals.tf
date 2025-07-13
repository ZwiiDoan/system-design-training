locals {
  project_name = "robo-advisor"
  default_tags = {
    Project     = local.project_name
    Environment = "Lab"
    Owner       = "zwiid"
    ManagedBy   = "Terraform"
  }
}
