##############################
# EC2 Instance Setting
##############################

## Hostname
variable "tags_name" {
  default = "host-name"
}

## ec2 instance type
variable "instance_type" {
  default = "t2.micro"
}

## ebs volume size (GB)
variable "ebs_volume_size" {
  default = 30
}

## root volume size (GB)
variable "root_volume_size" {
  default = 10
}

## sub domain setting
variable "fqdns" {
  type = "map"

  default = {
    "1" = "host-name.cygr.jp"

    #"2" = "host-name.sub.cygr.jp"
  }
}

#############################
# Security Group Setting
#############################
#
# Protocol,Port,IPアドレス群がキー番号(1,2,3...)と紐付いています
#
variable "protocols" {
  type = "map"

  default = {
    "1" = "tcp"
    "2" = "tcp"
    "3" = "tcp"
  }
}

# 許可ポート番号を追加 FROM
variable "from_allow_ports" {
  type = "map"

  default = {
    "1" = "22"
    "2" = "80"
    "3" = "443"
  }
}

# 許可ポート番号を追加 TO
variable "to_allow_ports" {
  type = "map"

  default = {
    "1" = "22"
    "2" = "80"
    "3" = "443"
  }
}

# 許可IPアドレスを追加
variable "port_allow_ips" {
  default = {
    # port 22
    "1" = [
      "X.X.X.X/32",
    ]

    # port 80
    "2" = [
      "X.X.X.X/32",
    ]

    # port 443
    "3" = [
      "X.X.X.X/32",
    ]
  }
}
