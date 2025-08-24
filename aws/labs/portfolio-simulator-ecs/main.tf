data "archive_file" "app_source" {
  type        = "zip"
  source_dir  = "../portfolio-sim-api/src"
  output_path = "${path.module}/app_source.zip"
}
data "aws_ecr_authorization_token" "token" {}

provider "docker" {
  registry_auth {
    address  = data.aws_ecr_authorization_token.token.proxy_endpoint
    username = "AWS"
    password = data.aws_ecr_authorization_token.token.password
  }
}

resource "aws_ecr_repository" "app" {
  name         = var.app_name
  force_delete = true
}


resource "docker_image" "app" {
  name = "${aws_ecr_repository.app.repository_url}:latest"
  build {
    context = "../portfolio-sim-api"
  }
  triggers = {
    dir_sha1 = data.archive_file.app_source.output_sha
  }
  keep_locally = false
}

resource "docker_registry_image" "app" {
  name          = "${aws_ecr_repository.app.repository_url}:latest"
  keep_remotely = true

  depends_on = [docker_image.app]
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.2"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}
