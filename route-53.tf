// domain.com (NS, SOA)
resource "aws_route53_zone" "www" {
  name    = var.route_53_domain
  comment = "Hosted zone for ${var.route_53_domain}."
}

// domain.com (A)
resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.www.zone_id
  name    = ""
  type    = "A"
  ttl     = "300"
  records = [aws_instance.webserver.public_ip]
}

// adminer.domain.com (A)
resource "aws_route53_record" "adminer-a" { // <= TODO - Enter variable value.
  zone_id = aws_route53_zone.www.zone_id
  name    = "adminer"  // <= TODO - Enter variable value.
  type    = "A"
  ttl     = "300"
  records = [aws_instance.webserver.public_ip]
}

// www.domain.com (CNAME)
resource "aws_route53_record" "www-cname" {
  zone_id = aws_route53_zone.www.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = "300"
  records = [var.route_53_domain]
}