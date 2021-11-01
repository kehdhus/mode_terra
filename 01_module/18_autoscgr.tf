resource "aws_placement_group" "dhk_pg" {
  name = "dhk-pg"
  strategy = "cluster"
 
}
resource "aws_autoscaling_group" "dhk_atsg" {
  name = "dhk-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.dhk_laun.name
  vpc_zone_identifier = [aws_subnet.dhk_puba.id, aws_subnet.dhk_pubc.id]
}