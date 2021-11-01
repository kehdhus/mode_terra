resource "aws_lb" "dhk_lb" {
  name                = "dhk-alb" 
  internal            = false
  load_balancer_type  = "application" 
  security_groups     = [aws_security_group.dhk_websg.id]
  subnets             = [aws_subnet.dhk_puba.id, aws_subnet.dhk_pubc.id]                     

  tags = {
    Name = "dhk-alb"
  }

}