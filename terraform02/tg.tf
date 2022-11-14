resource "aws_lb_target_group" "jenkins_tg" {
  name     = "jenkins-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.visitka_vpc.id
}

resource "aws_alb_target_group_attachment" "jenkins_tga" {
  target_group_arn = aws_lb_target_group.jenkins_tg.arn
  target_id        = aws_instance.jenkins_server.id
}


resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.visitka_vpc.id
}

resource "aws_alb_target_group_attachment" "web_tga" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_server.id
}