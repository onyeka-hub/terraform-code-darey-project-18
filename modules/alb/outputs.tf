output "alb_dns_name" {
  value = aws_lb.ext-alb.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.nginx-tgt.arn
}

output "wordpress-tgt" {
  value = aws_lb_target_group.wordpress-tgt.arn
}

output "nginx-tgt" {
  value = aws_lb_target_group.nginx-tgt.arn
}

output "tooling-tgt" {
  value = aws_lb_target_group.tooling-tgt.arn
}

output "ext_lb_dns_name" {
  value =  aws_lb.ext-alb.dns_name
}