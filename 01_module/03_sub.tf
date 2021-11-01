# 가용영역 a Public Subnet
resource "aws_subnet" "dhk_puba" {
  vpc_id            = aws_vpc.dhk_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "DH_puba"
  }
}

# 가용영역 a Private Subnet
resource "aws_subnet" "dhk_pria" {
  vpc_id            = aws_vpc.dhk_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "DH_pria"
  }
}

# 가용영역 c Public Subnet
resource "aws_subnet" "dhk_pubc" {
  vpc_id            = aws_vpc.dhk_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "DH_pubc"
  }
}

# 가용영역 c Private Subnet
resource "aws_subnet" "dhk_pric" {
  vpc_id            = aws_vpc.dhk_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "DH_pric"
  }
}