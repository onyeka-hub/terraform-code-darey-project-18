output "Jenkins-public-ip" {
  value = aws_instance.Jenkins.public_ip
  description = "Jenkins public ip"
}

output "Jenkins-instance-state" {
  value = aws_instance.Jenkins.instance_state
  description = "Jenkins instance state"
}

output "sonarqube-public-ip" {
  value = aws_instance.sonarqube.public_ip
  description = "Jenkins public ip"
}

output "sonarqube-instance-state" {
  value = aws_instance.sonarqube.instance_state
  description = "Jenkins instance state"
}

output "artifactory-public-ip" {
  value = aws_instance.artifactory.public_ip
  description = "Jenkins public ip"
}

output "artifactory-instance-state" {
  value = aws_instance.artifactory.instance_state
  description = "Jenkins instance state"
}