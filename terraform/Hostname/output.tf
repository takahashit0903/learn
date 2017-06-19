output "EIPs of develop servers" {
  value = "${join(",",aws_eip.ec2_instance.*.public_ip)}"
}

output "Fqdn of develop servers" {
  value = "${join(",",aws_route53_record.sub_record.*.fqdn)}"
}
