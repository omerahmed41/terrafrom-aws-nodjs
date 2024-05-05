
# Create an ELB
resource "aws_elb" "example" {
  name               = "terraform-example-elb"
  availability_zones = data.aws_availability_zones.all.names
  security_groups    = [aws_security_group.elb.id]

  listener {
    lb_port           = 80   # External traffic on 80
    lb_protocol       = "http"
    instance_port     = 3000  # Forward to 3000 on EC2
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:3000/"  # Check on 3000
  }
}

# Attach EC2 instance to ELB
resource "aws_elb_attachment" "example_attach" {
  elb      = aws_elb.example.id
  instance = aws_instance.example.id
}

