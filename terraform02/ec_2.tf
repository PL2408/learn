resource "aws_instance" "visitka_ec2_server" {
  ami                         = "ami-05ff5eaef6149df49"
  instance_type               = "t2.micro"
  key_name                    = "p_l"
  subnet_id                   = aws_subnet.public_subnet01.id
  vpc_security_group_ids      = [aws_security_group.visitka_ec2_sg.id]
  user_data                   = file("config/user_data_jn.sh")
  associate_public_ip_address = true
  user_data_replace_on_change = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "visitka_ec2_server"
  }
}

output "ec2_public_ip" {
  value = aws_instance.visitka_ec2_server.public_ip
}


