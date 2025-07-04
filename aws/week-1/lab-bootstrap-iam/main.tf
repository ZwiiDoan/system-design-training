# -----------------------------------------------------------------------------
# AWS Bootstrap Admin User Project
# -----------------------------------------------------------------------------
# This Terraform configuration is intended to be run ONCE using the AWS root
# account (or an account with full admin privileges) to bootstrap your first
# IAM admin user and securely store its credentials in AWS Secrets Manager.
#
# DO NOT use this project for regular user creation or daily operations.
# After running this, log in as the new admin user for all future AWS work.
# -----------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "terraform_user" {
  name = var.user_name
  tags = {
    ManagedBy = "Terraform-Bootstrap"
    Purpose   = "AccountBootstrapAdmin"
  }
}

resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terraform_user.name
}

resource "aws_iam_user_policy" "terraform_user_policy" {
  name = "bootstrap-admin-policy"
  user = aws_iam_user.terraform_user.name
  policy = data.aws_iam_policy_document.bootstrap_admin_policy.json
}

data "aws_iam_policy_document" "bootstrap_admin_policy" {
  statement {
    sid    = "AllowAllAdminActions"
    effect = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_secretsmanager_secret" "terraform_user_creds" {
  name        = "${var.user_name}-credentials"
  description = "Access credentials for Bootstrap Admin IAM user"
  tags = {
    CreatedBy = "terraform-bootstrap"
    Purpose   = "AccountBootstrapAdmin"
  }
}

resource "aws_secretsmanager_secret_version" "terraform_user_creds_version" {
  secret_id     = aws_secretsmanager_secret.terraform_user_creds.id
  secret_string = jsonencode({
    access_key_id     = aws_iam_access_key.terraform_user_key.id
    secret_access_key = aws_iam_access_key.terraform_user_key.secret
  })
}
