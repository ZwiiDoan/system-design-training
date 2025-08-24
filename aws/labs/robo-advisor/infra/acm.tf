# ACM certificate for custom domain (in us-east-1, required by CloudFront)
resource "aws_acm_certificate" "frontend_cert" {
  count             = var.custom_domain != null ? 1 : 0
  domain_name       = var.custom_domain
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

# ACM validation records (output for manual DNS validation)

# Use for_each to handle all domain validation options
resource "aws_route53_record" "frontend_cert_validation" {
  for_each = var.custom_domain != null && length(aws_acm_certificate.frontend_cert) > 0 ? {
    for dvo in aws_acm_certificate.frontend_cert[0].domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  } : {}
  zone_id = var.route53_zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "frontend_cert_validation" {
  count                   = var.custom_domain != null ? 1 : 0
  certificate_arn         = aws_acm_certificate.frontend_cert[0].arn
  validation_record_fqdns = [for record in aws_route53_record.frontend_cert_validation : record.value.fqdn]
  depends_on              = [aws_route53_record.frontend_cert_validation]
}
