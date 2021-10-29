resource "aws_ami_from_instance" "jwcho_ami" {
  name = "jwcho-ami"   
  source_instance_id = aws_instance.jwcho_weba.id
}