resource "aws_route53_record" "sub_record" {
  count      = "${length(var.fqdns)}"
  zone_id    = "<Zone id>"
  name       = "${lookup(var.fqdns,format("%d",count.index + 1))}"
  type       = "A"
  ttl        = "300"
  records    = ["${aws_eip.ec2_instance.*.public_ip}"]
  depends_on = ["aws_eip.ec2_instance"]
}
