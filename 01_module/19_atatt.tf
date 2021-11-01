resource "aws_autoscaling_attachment" "dhk_atatt" {
  autoscaling_group_name = aws_autoscaling_group.dhk_atsg.id  
  alb_target_group_arn = aws_lb_target_group.dhk_lbtg.arn
}