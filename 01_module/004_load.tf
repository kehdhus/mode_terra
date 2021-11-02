resource "aws_lb" "dhk_lb" {
  name                = "${var.name}-alb" 
  internal            = false
  load_balancer_type  = var.lb_type
  security_groups     = [aws_security_group.dhk_websg.id]
  subnets             = [aws_subnet.dhk_pub[0].id, aws_subnet.dhk_pub[1].id]                     

  tags = {
    Name = "${var.name}-alb"
  }

}

resource "aws_lb_target_group" "dhk_lbtg" {
  name = "${var.name}-lbtg"
  port = var.port_http
  protocol = var.protocol_HTTP
  vpc_id = aws_vpc.dhk_vpc.id


  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path =  "/health.html"
    port = "traffic-port"
    protocol = var.protocol_HTTP
    timeout = 2
    unhealthy_threshold = 2
  }
}


resource "aws_lb_listener" "dhk_listener" {
  load_balancer_arn = aws_lb.dhk_lb.arn   
  port = var.port_http
  protocol = var.protocol_HTTP
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.dhk_lbtg.arn
  }
}


