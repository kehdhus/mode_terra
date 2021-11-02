resource "aws_eip" "lb_ip" {
  #instance = aws_instance.web.id

  vpc = true
}

resource "aws_nat_gateway" "dhk_ng"{
  allocation_id = aws_eip.lb_ip.id
  subnet_id = aws_subnet.dhk_pub[0].id
  tags = {
    Name = "${var.name}-ng"
  }
}

resource "aws_route_table" "dhk_ngrt" {
  vpc_id = aws_vpc.dhk_vpc.id
  route {
    cidr_block = var.cidr
    gateway_id = aws_nat_gateway.dhk_ng.id
  }
  tags = {
    Name  = "${var.name}_ng_rt"
  }
}

resource "aws_route_table_association" "dhk_ngrtas" {
  count = 2
  subnet_id         = aws_subnet.dhk_pri[count.index].id
  route_table_id    = aws_route_table.dhk_ngrt.id
}

