resource "aws_lb_target_group" "jwcho_lb_tg" {
  name = "jwcho-lbtg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.jwcho_vpc.id
  
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  }
}


resource "aws_lb_listener" "jwcho_front-end" {
  load_balancer_arn = aws_lb.jwcho_lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type  = "forward"
    target_group_arn = aws_lb_target_group.jwcho_lb_tg.arn
  }
}