resource "aws_lb_target_group_attachment" "dhk_lbtg_att" {
  target_group_arn = aws_lb_target_group.dhk_lbtg.arn 
  target_id = aws_instance.dhk_weba.id
  port  = var.port_http
}


resource "aws_ami_from_instance" "dhk_ami" {
  name = "${var.name}-ami"  
  source_instance_id = aws_instance.dhk_weba.id  
}

/*resource "aws_launch_configuration" "dhk_launch"{
  name = "dhk-web"
  image_id = aws_ami_from_instance.dhk_ami.id
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.dhk_websg.id]
  key_name = "tf-key"
  user_data = <<-EOF
                #!/bin/bash
                sudo su -
                systemctl start httpd
                systemctl enable httpd
                EOF
  lifecycle {
                 create_before_destroy = true
                }
}*/

resource "aws_launch_configuration" "dhk_laun" {
  name = "${var.name}-web"
  image_id = aws_ami_from_instance.dhk_ami.id
  instance_type = var.instance
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.dhk_websg.id]
  key_name = var.key
  user_data =<<-EOF
              #!/bin/bash
              systemctl start httpd
              systemctl enable httpd
              EOF
  lifecycle {
    create_before_destroy  = true
  }
}


resource "aws_placement_group" "dhk_pg" {
  name = "${var.name}-pg"
  strategy = "cluster"
 
}
resource "aws_autoscaling_group" "dhk_atsg" {
  name = "${var.name}-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.dhk_laun.name
  vpc_zone_identifier = [aws_subnet.dhk_pub[0].id, aws_subnet.dhk_pub[1].id]
}

resource "aws_autoscaling_attachment" "dhk_atatt" {
  autoscaling_group_name = aws_autoscaling_group.dhk_atsg.id  
  alb_target_group_arn = aws_lb_target_group.dhk_lbtg.arn
}