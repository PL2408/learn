resource "aws_security_group" "jenkins_ec2_sg" {
  name        = "jenkins_ec2_sg"
  description = "Access to jenkins server"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    description = "SSH traffic from my workstation"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.visitka_elb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_ec2_sg"
  }
}

resource "aws_security_group" "agent_ec2_sg" {
  name        = "agent_ec2_sg"
  description = "Access to jenkins agent"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    description = "SSH traffic from my workstation"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  ingress {
    description     = "SSH traffic from my workstation"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins_ec2_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "agent_ec2_sg"
  }
}

resource "aws_security_group" "web_ec2_sg" {
  name        = "web_ec2_sg"
  description = "Access to web server"
  vpc_id      = aws_vpc.visitka_vpc.id

  ingress {
    description = "SSH traffic from my workstation"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  ingress {
    description     = "SSH traffic from my workstation"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.agent_ec2_sg.id]
  }
  ingress {
    description     = "HTTP traffic from ELB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.visitka_elb_sg.id]
  }
  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_ec2_sg"
  }
}