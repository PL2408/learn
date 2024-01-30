resource "aws_route_table" "visitka_rt" {
  vpc_id = aws_vpc.visitka_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.visitka_igw.id
  }

  tags = {
    Name = "visitka_rt"
  }
}