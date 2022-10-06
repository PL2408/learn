resource "aws_security_group" "web_ec2_sg" {
  name        = "web_ec2_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    description = "SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web_ec2_sg"
  }
}