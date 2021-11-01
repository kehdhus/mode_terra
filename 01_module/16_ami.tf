resource "aws_ami_from_instance" "dhk_ami" {
  name = "dhk-ami"  
  source_instance_id = aws_instance.dhk_weba.id  
  
}