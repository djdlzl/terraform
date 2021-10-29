resource "aws_security_group" "jwcho_websg" {
  name        = "Allow-WEB"
  description = "http, ssh, icmp"
  vpc_id = aws_vpc.jwcho_vpc.id

  ingress = [
      {
          description       = "ssh"
          from_port         = 22
          to_port           = 22
          protocol          = "tcp"
          cidr_blocks       = ["0.0.0.0/0"]
          ipv6_cidr_blocks  = ["::/0"]
          prefix_list_ids   = null
          security_groups = null
          self = null

      }, {
          description       = "http"
          from_port         = 80
          to_port           = 80
          protocol          = "tcp"
          cidr_blocks       = ["0.0.0.0/0"]
          ipv6_cidr_blocks  = ["::/0"]
          prefix_list_ids   = null
          security_groups = null
          self = null
      }, {
          description       = "icmp"
          from_port         = -1
          to_port           = -1
          protocol          = "icmp"
          cidr_blocks       = ["0.0.0.0/0"]
          ipv6_cidr_blocks  = ["::/0"]
          prefix_list_ids   = null
          security_groups = null
          self = null
      }
  ]

  egress = [
      {
          description = "All"
          from_port = 0
          to_port =0
          protocol = "-1"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = ["::/0"]
          prefix_list_ids   = null
          security_groups = null
          self = null
      }
  ]

  tags = {
    "Name" = "Allow-WEB"
  }
}