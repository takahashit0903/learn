resource "aws_instance" "ec2_instance" {
  count                  = 1
  ami                    = "<AMI>"
  availability_zone      = "ap-northeast-1a"
  instance_type          = "${var.instance_type}"
  monitoring             = true
  key_name               = "<key>"
  subnet_id              = "<subnet id>"
  vpc_security_group_ids = ["<default sg>", "${aws_security_group.sg.id}"]
  source_dest_check      = true

  ebs_block_device {
    device_name           = "/dev/xvdcz"
    snapshot_id           = ""
    volume_type           = "gp2"
    volume_size           = "${var.ebs_volume_size}"
    delete_on_termination = true
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [
      "ebs_block_device",
    ]
  }

  tags {
    "Name" = "${var.tags_name}"
  }
}

resource "aws_eip" "ec2_instance" {
  count    = 1
  instance = "${element(aws_instance.ec2_instance.*.id, count.index)}"
  vpc      = true
}
