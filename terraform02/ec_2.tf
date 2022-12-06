resource "aws_instance" "jenkins_server" {
  ami                         = "ami-05ff5eaef6149df49"
  instance_type               = "t3.micro"
  key_name                    = "p_l"
  subnet_id                   = aws_subnet.public_subnet01.id
  vpc_security_group_ids      = [aws_security_group.jenkins_ec2_sg.id]
  user_data                   = file("config/user_data_jenkins.sh")
  associate_public_ip_address = true
  user_data_replace_on_change = true
  private_ip                  = "10.0.0.123"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "jenkins-server"
  }
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

resource "aws_instance" "jenkins_agent" {
  ami                         = "ami-05ff5eaef6149df49"
  instance_type               = "t3.micro"
  key_name                    = "p_l"
  subnet_id                   = aws_subnet.public_subnet01.id
  vpc_security_group_ids      = [aws_security_group.agent_ec2_sg.id]
  user_data                   = file("config/user_data_agent.sh")
  associate_public_ip_address = true
  user_data_replace_on_change = true
  private_ip                  = "10.0.0.124"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "jenkins_agent"
  }
}

output "agent_public_ip_new" {
  value = aws_instance.jenkins_agent.public_ip
}

resource "aws_instance" "web_server" {
  ami                         = "ami-05ff5eaef6149df49"
  instance_type               = "t3.micro"
  key_name                    = "p_l"
  subnet_id                   = aws_subnet.public_subnet01.id
  vpc_security_group_ids      = [aws_security_group.web_ec2_sg.id]
  user_data                   = file("config/user_data_web.sh")
  associate_public_ip_address = true
  user_data_replace_on_change = true
  private_ip                  = "10.0.0.125"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }

  tags = {
    Name = "web-server"
  }
}

output "web_public_ip" {
  value = aws_instance.web_server.public_ip
}
