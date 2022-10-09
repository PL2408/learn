resource "aws_lb" "visitka_lb" {
  name               = "visitka-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.visitka_elb_sg.id]
  subnets            = [aws_subnet.public_subnet01.id, aws_subnet.public_subnet02.id]

  tags = {
    Name = "visitka-lb"
  }
}

resource "aws_lb_listener" "visitka_lb_lst" {
  load_balancer_arn = aws_lb.visitka_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-2019-08"
  certificate_arn   = aws_acm_certificate.visitka_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.visitka_ec2_tg.arn
  }
}