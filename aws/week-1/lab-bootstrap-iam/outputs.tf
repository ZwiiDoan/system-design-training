output "iam_user_name" {
  value       = aws_iam_user.terraform_user.name
  description = "The name of the created IAM user."
}

output "iam_user_arn" {
  value       = aws_iam_user.terraform_user.arn
  description = "The ARN of the created IAM user."
}

output "iam_access_key_id" {
  value       = aws_iam_access_key.terraform_user_key.id
  description = "The access key ID for the IAM user."
  sensitive   = true
}

output "iam_secret_access_key" {
  value       = aws_iam_access_key.terraform_user_key.secret
  description = "The secret access key for the IAM user."
  sensitive   = true
}

output "secretsmanager_secret_arn" {
  value       = aws_secretsmanager_secret.terraform_user_creds.arn
  description = "The ARN of the Secrets Manager secret storing the credentials."
}
