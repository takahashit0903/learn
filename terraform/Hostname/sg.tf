resource "aws_security_group" "sg" {
  name        = "${format("%s-Grp", var.tags_name)}"
  description = "${format("security group %s", var.tags_name)}"
  vpc_id      = "<VPC id>"
}

resource "aws_security_group_rule" "allow_outbound_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg.id}"
}

resource "aws_security_group_rule" "allow_inbound_rule" {
  count             = "${length(var.from_allow_ports)}"
  type              = "ingress"
  from_port         = "${lookup(var.from_allow_ports,format("%d",count.index + 1))}"
  to_port           = "${lookup(var.to_allow_ports,format("%d",count.index + 1))}"
  protocol          = "${lookup(var.protocols,format("%d",count.index + 1))}"
  cidr_blocks       = ["${var.port_allow_ips[format("%d",count.index + 1)]}"]
  security_group_id = "${aws_security_group.sg.id}"
}
