resource "aws_acm_certificate" "visitka_cert" {
  domain_name       = "lopihara.iplatinum.pro"
  validation_method = "DNS"

  tags = {
    Environment = "visitka_cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "visitka_hz" {
  name         = "lopihara.iplatinum.pro"
  private_zone = false
}

resource "aws_route53_record" "visitka_cert_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.visitka_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.visitka_hz.zone_id
}

resource "aws_acm_certificate_validation" "visitka_cert_validation" {
  certificate_arn         = aws_acm_certificate.visitka_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.visitka_cert_validation_record : record.fqdn]
}