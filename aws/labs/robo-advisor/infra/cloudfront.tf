resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "${var.bucket_name}-oac"
  description                       = "OAC for S3 static site"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cdn" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = module.frontend_bucket.s3_bucket_bucket_regional_domain_name
    origin_id                = "s3-frontend"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-frontend"
    viewer_protocol_policy = "redirect-to-https"
    # See https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-policy-caching-optimized
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized
    compress = true
  }

  price_class = "PriceClass_100"
  viewer_certificate {
    acm_certificate_arn            = var.custom_domain != null ? aws_acm_certificate.frontend_cert[0].arn : null
    ssl_support_method             = var.custom_domain != null ? "sni-only" : null
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = var.custom_domain == null ? true : false
  }
  aliases = var.custom_domain != null ? [var.custom_domain] : []
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = var.tags
  depends_on = [aws_acm_certificate_validation.frontend_cert_validation]
}
