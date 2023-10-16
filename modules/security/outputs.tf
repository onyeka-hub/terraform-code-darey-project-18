
output "public-sg" {
  value = aws_security_group.onyi["ext-alb-sg"].id
}


output "private-sg" {
  value = aws_security_group.onyi["int-alb-sg"].id
}


output "bastion-sg" {
  value = aws_security_group.onyi["bastion-sg"].id
}


output "nginx-sg" {
  value = aws_security_group.onyi["nginx-sg"].id
}


output "web-sg" {
  value = aws_security_group.onyi["webserver-sg"].id
}


output "vpc_security_group_ids" {
  value = aws_security_group.onyi["datalayer-sg"].id
}