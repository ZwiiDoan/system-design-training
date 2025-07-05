# AWS Organization Setup Example
# This Terraform config creates an AWS Organization, two OUs (dev, test),
# an example SCP restricting S3 public access, and a cross-account IAM role trust policy.

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile # Use the bootstrap admin user's profile
}

resource "aws_organizations_organization" "main" {
  feature_set = "ALL"
  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY"
  ]
}

resource "aws_organizations_organizational_unit" "dev" {
  name      = "dev"
  parent_id = aws_organizations_organization.main.roots[0].id
  depends_on = [aws_organizations_organization.main]
}

resource "aws_organizations_organizational_unit" "test" {
  name      = "test"
  parent_id = aws_organizations_organization.main.roots[0].id
  depends_on = [aws_organizations_organization.main]
}

resource "aws_organizations_policy" "deny_s3_public" {
  name        = "DenyS3PublicAccess"
  description = "Deny S3 public access via SCP"
  content     = file("scps/deny_s3_public.json")
  type        = "SERVICE_CONTROL_POLICY"
  depends_on  = [aws_organizations_organization.main]
}

resource "aws_organizations_policy_attachment" "dev_scp" {
  policy_id = aws_organizations_policy.deny_s3_public.id
  target_id = aws_organizations_organizational_unit.dev.id
  depends_on = [aws_organizations_policy.deny_s3_public]
}

resource "aws_organizations_policy_attachment" "test_scp" {
  policy_id = aws_organizations_policy.deny_s3_public.id
  target_id = aws_organizations_organizational_unit.test.id
  depends_on = [aws_organizations_policy.deny_s3_public]
}

# Example cross-account IAM role trust policy (output only)
output "cross_account_trust_policy" {
  value = file("iam/cross_account_trust_policy.json")
}