data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "jwcho_weba" {
  ami                      = data.aws_ami.amzn.id
  instance_type            = "t2.micro"
  key_name                 = "tf-key1"
  vpc_security_group_ids   = [aws_security_group.jwcho_websg.id]
  availability_zone        = "ap-northeast-2a"
  private_ip               = "10.0.0.11"
  subnet_id                = aws_subnet.jwcho_puba.id
  user_data                = file("install_apache.sh")
  tags = {
    "Name" = "jwcho-weba"
  }
}