variable "region" {
  type = string
  default = "ap-northeast-2"  
}

variable "key" {
  type =string
  default = "dh-key"
  
}
variable "cidr_main" {
  type = string
  default = "10.0.0.0/16"
  
}
variable "name" {
  type = string
  default = "dhk"
  
}
variable "public_s" {
  type = list
  default = ["10.0.0.0/24", "10.0.2.0/24"]
  
}

variable "private_s" {
  type = list
  default = ["10.0.1.0/24", "10.0.3.0/24"]
  
}

variable "private_dbs" {
  type = list
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "avazone" {
  type = list
  default = ["a", "c"]
}

variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "v6_cidr" {
  type = string
  default = "::/0"
}

variable "private_ip" {
  type = string
  default = "10.0.0.11" 
}
variable "pri-a" {
  type = string
  default = "value"  
}

variable "protocol_tcp" {
  type = string
  default = "tcp"  
}

variable "protocol_udp" {
  type = string
  default = "udp" 
}

variable "protocol_http" {
  type = string
  default = "http"  
}
variable "protocol_HTTP" {
  type = string
  default = "HTTP"  
}

variable "protocol_icmp" {
  type = string
  default = "icmp"  
}

variable "protocol_ssh" {
  type = string
  default = "ssh"  
}

variable "protocol_mysql" {
  type = string
  default = "mysql"  
}

variable "port_ssh" {
  type = number
  default = 22  
}
variable "port_http" {
  type = number
  default = 80  
}
variable "port_mysql" {
  type = number
  default = 3306  
}

variable "port_0" {
  type = number
  default = 0  
}


variable "instance" {
  type = string
  default = "t2.micro"  
}

variable "lb_type"{
  type = string
  default = "application"
}