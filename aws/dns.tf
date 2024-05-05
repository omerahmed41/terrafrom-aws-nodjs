#resource "aws_route53_zone" "my_zone" {
#  name = "tradinggpt.nl"
#}

resource "aws_route53_record" "elb_alias" {
#  zone_id = aws_route53_zone.my_zone.zone_id
  zone_id = "Z04883782AU8E26WZS0FS"
  name    = "test.tradinggpt.nl"
  type    = "A"  # Alias record for IPv4

  alias {
    name                   = aws_elb.example.dns_name
    zone_id                = aws_elb.example.zone_id
    evaluate_target_health = true
  }
}