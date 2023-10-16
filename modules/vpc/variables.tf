variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "preferred_number_of_public_subnets" {
  default     = null
  type        = number
  description = "number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  default     = null
  type        = number
  description = "number of private subnets"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "max_subnets" {
  type = number
}

variable "name" {
  type = string  
}

variable "environment" {
  type = string
}

variable "public_subnets" {}

variable "private_subnets" {}