resource "aws_security_group" "visitka_elb_sg" {
  name        = "visitka_elb_sg"
  description = "HTTPS traffic"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    from_port   = 777
    to_port     = 777
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "visitka_elb_sg"
  }
}