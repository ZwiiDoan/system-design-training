output "iam_user_name" {
  value       = aws_iam_user.terraform_user.name
  description = "The name of the created IAM user."
}

output "iam_user_arn" {
  value       = aws_iam_user.terraform_user.arn
  description = "The ARN of the created IAM user."
}

output "secretsmanager_secret_arn" {
  value       = aws_secretsmanager_secret.terraform_user_creds.arn
  description = "The ARN of the Secrets Manager secret storing the credentials."
}
