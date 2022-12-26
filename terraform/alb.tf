resource "aws_lb" "jenkins" {
  name               = "Jenkins-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Public_SG.id]
  subnets            = ["${module.vpc.public_subnets[0]}","${module.vpc.public_subnets[1]}"]

  enable_deletion_protection = false

  tags = {
    Name = "Jenkins ALB"
  }
}


resource "aws_lb_target_group" "jenkins" {
  name     = "jenkins-TG"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${module.vpc.vpc_id}"
    health_check {
    path                = "/jenkins"
    port                = 8080
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-499"
  }
}


resource "aws_lb_target_group_attachment" "jenkins" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id        = aws_instance.jenkins.id
  port             = 8080
}

resource "aws_lb_listener" "jenkins" {
  load_balancer_arn = aws_lb.jenkins.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }
}


resource "aws_lb_listener_rule" "jenkins" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins*"]
    }
  }

}

