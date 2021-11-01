resource "aws_route_table" "dhk_ngrt_a" {
  vpc_id = aws_vpc.dhk_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.dhk_ng_a.id
  }
  tags = {
      Name = "dhk_ng_rt_a"
  }
}

resource "aws_route_table" "dhk_ngrt_c" {
   vpc_id = aws_vpc.dhk_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.dhk_ng_c.id
  }
  tags = {
      Name = "dhk_ng_rt_c"
  }
}