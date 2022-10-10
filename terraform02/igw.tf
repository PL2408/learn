resource "aws_internet_gateway" "visitka_igw" {
  vpc_id = aws_vpc.visitka_vpc.id

  tags = {
    Name = "visitka_igw"
  }
}