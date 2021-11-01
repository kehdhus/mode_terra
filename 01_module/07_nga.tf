resource "aws_eip" "lb_ip_a" {
  #instance = aws_instance.web.id
  vpc = true
}

resource "aws_eip" "lb_ip_c" {
  #instance = aws_instance.web.id
  vpc = true
}

resource "aws_nat_gateway" "dhk_ng_a"{
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id = aws_subnet.dhk_puba.id
  tags = {
    Name = "dhk-nga-a"
  }
}

resource "aws_nat_gateway" "dhk_ng_c"{
  allocation_id = aws_eip.lb_ip_c.id
  subnet_id = aws_subnet.dhk_pubc.id
  tags = {
    Name = "dhk-nga-c"
  }
}