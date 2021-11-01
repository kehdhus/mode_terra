resource "aws_internet_gateway" "dh-ig" {
  vpc_id = aws_vpc.dhk_vpc.id
  
  tags = {
    Name = "dh-ig"
  }
}