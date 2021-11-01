resource "aws_lb_target_group_attachment" "dhk_lbtg_att" {
  target_group_arn = aws_lb_target_group.dhk_lbtg.arn 
  target_id = aws_instance.dhk_weba.id
  port  = 80
}