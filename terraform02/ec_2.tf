resource "aws_instance" "web_ec2_server" {
  ami                    = "ami-05ff5eaef6149df49"
  instance_type          = "t2.micro"
  key_name               = "p_l"
  subnet_id              = aws_subnet.public_subnet01.id
  vpc_security_group_ids = [aws_security_group.web_ec2_sg.id]
  user_data              = file("config/user_data.sh")

  tags = {
    Name = "web_ec2_server"
  }
}



