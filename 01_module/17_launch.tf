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
  name = "dhk-web"
  image_id = aws_ami_from_instance.dhk_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.dhk_websg.id]
  key_name = "tf-key"
  user_data =<<-EOF
              #!/bin/bash
              systemctl start httpd
              systemctl enable httpd
              EOF
  lifecycle {
    create_before_destroy  = true
  }
}