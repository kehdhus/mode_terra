resource "aws_route_table_association" "dhk_rtas-a" {
  subnet_id      = aws_subnet.dhk_puba.id
  route_table_id = aws_route_table.dhk_rt.id
}

resource "aws_route_table_association" "dhk_rtas-c" {
  subnet_id      = aws_subnet.dhk_pubc.id
  route_table_id = aws_route_table.dhk_rt.id
}

