
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.private.*.id
}

output "public_subnets-1" {
  value       = aws_subnet.public[0].id
  description = "The first public subnet in the subnets"
}

output "public_subnets-2" {
  value       = aws_subnet.public[1].id
  description = "The second public subnet"
}


output "private_subnets-1" {
  value       = aws_subnet.private[0].id
  description = "The first private subnet"
}

output "private_subnets-2" {
  value       = aws_subnet.private[1].id
  description = "The second private subnet"
}


output "private_subnets-3" {
  value       = aws_subnet.private[2].id
  description = "The third private subnet"
}


output "private_subnets-4" {
  value       = aws_subnet.private[3].id
  description = "The fourth private subnet"
}

output "instance_profile" {
  value = aws_iam_instance_profile.ip.id
}