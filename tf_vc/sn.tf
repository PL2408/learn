resource "aws_subnet" "public_subnet01" {
  vpc_id            = aws_vpc.visitka_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "public_subnet01"
  }
}

resource "aws_subnet" "public_subnet02" {
  vpc_id            = aws_vpc.visitka_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "public_subnet02"
  }
}

resource "aws_route_table_association" "sn01_ass" {
  subnet_id      = aws_subnet.public_subnet01.id
  route_table_id = aws_route_table.visitka_rt.id
}

resource "aws_route_table_association" "sn02_ass" {
  subnet_id      = aws_subnet.public_subnet02.id
  route_table_id = aws_route_table.visitka_rt.id
}