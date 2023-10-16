# output "s3_bucket_arn" {
#   value       = aws_s3_bucket.terraform-state.arn
#   description = "The ARN of the S3 bucket"
# }
# output "dynamodb_table_name" {
#   value       = aws_dynamodb_table.terraform_locks.name
#   description = "The name of the DynamoDB table"
# }

# output "ext_lb_dns_name" {
#   value = module.alb.ext_lb_dns_name
# }

# output "Jenkins-public-ip" {
#   value       = module.compute.Jenkins-public-ip
#   description = "Jenkins public ip"
# }

# output "Jenkins-instance-state" {
#   value       = module.compute.Jenkins-instance-state
#   description = "Jenkins instance state"
# }

# output "sonarqube-public-ip" {
#   value       = module.compute.sonarqube-public-ip
#   description = "Jenkins public ip"
# }

# output "sonarqube-instance-state" {
#   value       = module.compute.sonarqube-instance-state
#   description = "Jenkins instance state"
# }

# output "artifactory-public-ip" {
#   value       = module.compute.artifactory-public-ip
#   description = "Jenkins public ip"
# }

# output "artifactory-instance-state" {
#   value       = module.compute.artifactory-instance-state
#   description = "Jenkins instance state"
# }
