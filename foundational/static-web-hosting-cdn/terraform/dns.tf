data "aws_route53_zone" "this" {
  count        = var.manage_dns_record ? 1 : 0
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "cdn_alias_ipv4" {
  count   = var.manage_dns_record ? 1 : 0
  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cdn_alias_ipv6" {
  count   = var.manage_dns_record ? 1 : 0
  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
