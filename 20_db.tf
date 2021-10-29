resource "aws_db_instance" "jwcho_db" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "wordpress"
  identifier = "mydb"
  username = "master"
  password = "It123412341!"
  parameter_group_name = "default.mysql5.7"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.jwcho_db_sb_group.id
  skip_final_snapshot = true
  tags = {
    "Name" = "mydb"
  }
}