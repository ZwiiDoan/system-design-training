terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source           = "terraform-aws-modules/ecr/aws"
  repository_name  = var.ecr_repo_name
}

resource "null_resource" "docker_build_and_push" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${module.ecr.repository_url}
      docker build -t ${module.ecr.repository_url}:latest ../portfolio-sim-api
      docker push ${module.ecr.repository_url}:latest
    EOT
  }
  depends_on = [module.ecr]
}
