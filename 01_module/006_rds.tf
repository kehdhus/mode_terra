
resource "aws_db_subnet_group" "dhk_db_group" {
  name = "db-group"
  subnet_ids = [aws_subnet.dhk_pridbs[0].id,aws_subnet.dhk_pridbs[1].id] 
  tags ={
      Name = "${var.name}-dbgroup"
  }
}


resource "aws_db_instance" "dhk_db" {
  allocated_storage       =  10
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  identifier              = "mydb"
  username                = "admin"
  password                = "It12345!"
  parameter_group_name    = "default.mysql8.0"
  availability_zone       = "${var.region}${var.avazone[0]}"
 
  db_subnet_group_name = aws_db_subnet_group.dhk_db_group.id
  vpc_security_group_ids  = [aws_security_group.dhk_websg.id]
  skip_final_snapshot = true
  tags = {
      name = "${var.name}-mydb"
  }
   
  
}