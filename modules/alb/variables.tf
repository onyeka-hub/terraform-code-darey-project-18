variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  type = string
  description = "name of the company that have the resource"
}

variable "public-sg" {
  description = "the security group of the ext load balancer"
}

variable "private-sg" {
  description = "the security group of the int load balancer"
}

variable "public-sbn-1" {}

variable "public-sbn-2" {}

variable "private-sbn-1" {}

variable "private-sbn-2" {}

variable "vpc_id" {}

variable "ip_address_type" {}

variable "load_balancer_type" {}