module "frontend_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket  = var.bucket_name
  versioning = {
    enabled = true
  }
  website = {
    index_document = "index.html"
    error_document = "index.html"
  }
  force_destroy = true
  tags = var.tags
}

# Grant CloudFront OAC access to the S3 bucket
resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = module.frontend_bucket.s3_bucket_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${module.frontend_bucket.s3_bucket_arn}/*"
        ]
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.cdn.arn
          }
        }
      }
    ]
  })
}
