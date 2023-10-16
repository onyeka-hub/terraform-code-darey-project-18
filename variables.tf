#########################################
# vpc variables 
#########################################
variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "max_subnets" {}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}

variable "name" {
  type    = string
  default = "onyeka"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Enviroment"
}

#########################################
# rds variables 
#########################################

variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "master-username" {
  type        = string
  description = "RDS admin username"
}

variable "master-password" {
  type        = string
  description = "RDS master password"
}

variable "multi_az" {}

#########################################
# rds variables 
#########################################

variable "account_no" {
  type        = number
  description = "the account number"
}

variable "user" {
  type = string
}

#########################################
# Auto scaling group variables 
#########################################

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

variable "ami-web" {}

variable "ami-bastion" {}

variable "ami-nginx" {}

variable "max_size" {}

variable "min_size" {}

variable "desired_capacity" {}

#########################################
# compute variables 
#########################################

# variable "ami" {
#   type        = string
#   description = "AMI ID for compute resources"
# }
