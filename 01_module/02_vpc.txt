resource "aws_vpc" "dhk_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dhk-vpc"
  }
}