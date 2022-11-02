resource "aws_security_group" "visitka_ec2_sg" {
  name        = "visitka_ec2_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    description = "SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.visitka_elb_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "visitka_ec2_sg"
  }
}

