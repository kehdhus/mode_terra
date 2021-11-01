resource "aws_route_table_association" "dhk_ngrtas_a" {
  subnet_id = aws_subnet.dhk_pria.id
  route_table_id = aws_route_table.dhk_ngrt_a.id
}


resource "aws_route_table_association" "dhk_ngrtas_c" {
  subnet_id = aws_subnet.dhk_pric.id
  route_table_id = aws_route_table.dhk_ngrt_c.id
}