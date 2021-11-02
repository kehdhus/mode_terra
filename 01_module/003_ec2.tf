resource "aws_security_group" "dhk_websg" {
  name        = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id      = aws_vpc.dhk_vpc.id

  ingress = [
    {
      description       = var.protocol_ssh
      from_port         = var.port_ssh
      to_port           = var.port_ssh
      protocol          = var.protocol_tcp
      cidr_blocks       = [var.cidr]
      ipv6_cidr_blocks  = [var.v6_cidr]
      security_groups   =  null
      prefix_list_ids   =  null
      self              =  null
    },
    {
      description     =   var.protocol_http
      from_port       =   var.port_http
      to_port         =   var.port_http
      protocol        =   var.protocol_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.v6_cidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = var.protocol_icmp
      from_port       = -1
      to_port         = -1
      protocol        = var.protocol_icmp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.v6_cidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = var.protocol_mysql
      from_port       = var.port_mysql
      to_port         = var.port_mysql
      protocol        = var.protocol_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.v6_cidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
  ]

   egress = [
     {
      description     = "All"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.v6_cidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
   ]
  tags = {
    Name = "${var.name}-sg"
  }
} 

data "aws_ami" "amzn" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    owners = ["amazon"]

}

# web instance
resource "aws_instance" "dhk_weba"{
  ami = data.aws_ami.amzn.id
  instance_type = var.instance
  key_name = var.key
  vpc_security_group_ids = [aws_security_group.dhk_websg.id]
  availability_zone = "${var.region}${var.avazone[0]}"
  private_ip = var.private_ip
  subnet_id = aws_subnet.dhk_pub[0].id
  user_data = file("./install_seoul.sh")


  tags = {
    Name = "${var.name}-web1a"
  }
}

resource "aws_eip" "dhk_web_eip" {
  vpc = true
  instance                    = aws_instance.dhk_weba.id
  associate_with_private_ip   = var.private_ip
  depends_on                  = [aws_internet_gateway.dhk_ig]
  
}


