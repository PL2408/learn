resource "aws_lb_target_group" "visitka_ec2_tg" {
  name     = "visitka-ec2-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.visitka_vpc.id
}

resource "aws_alb_target_group_attachment" "visitka_ec2_tga" {
  target_group_arn = aws_lb_target_group.visitka_ec2_tg.arn
  target_id        = aws_instance.visitka_ec2_server.id
}