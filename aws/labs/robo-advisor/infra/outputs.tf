output "bucket_name" {
  value = module.frontend_bucket.s3_bucket_id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}
