resource "aws_lb_listener" "dhk_listener" {
  load_balancer_arn = aws_lb.dhk_lb.arn   
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.dhk_lbtg.arn
  }
}