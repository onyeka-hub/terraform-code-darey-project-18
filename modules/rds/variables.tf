variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "master-username" {
  type = string
}

variable "master-password" {
  type = string
}

variable "subnet_ids" {
  description = "aws_subnet.private.*.id"
}

variable "name" {
  type = string
}

variable "vpc_security_group_ids" {
  description = "aws_security_group.datalayer-sg.id"
}

variable "multi_az" {
  type = bool
}

variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}
