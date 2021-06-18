# Create a new load balancer
resource "aws_elb" "web-elb" {
  name               = "javahome-web-elb"

  subnets = local.pub_sub_ids
  security_groups = [ aws_security_group.web_sg.id ]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.web.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 30
  connection_draining         = true
  connection_draining_timeout = 30

  tags = {
    Name = "  terraform-elb"
  }
}