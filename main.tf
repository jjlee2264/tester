resource "aws_autoscaling_group" "asg-1" {

  launch_configuration    = aws_launch_configuration.lc-1.id
  health_check_type       = "EC2"
  min_size                = var.asg_count
  max_size                = var.asg_count
  desired_capacity        = var.asg_count
  vpc_zone_identifier     = [aws_subnet.pub1.id,aws_subnet.pub2.id]
  target_group_arns       = [ aws_lb_target_group.tg-1.arn ]
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "Version-1"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "asg-2" {

  launch_configuration    = aws_launch_configuration.lc-2.id
  health_check_type       = "EC2"
  min_size                = var.asg_count
  max_size                = var.asg_count
  desired_capacity        = var.asg_count
  vpc_zone_identifier     = [aws_subnet.pub1.id,aws_subnet.pub2.id]
  target_group_arns       = [ aws_lb_target_group.tg-2.arn ]
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "Version-2"
  }

  lifecycle {
    create_before_destroy = true
  }
}
