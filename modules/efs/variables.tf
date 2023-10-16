variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "account_no" {
  type = number
}

variable "user" {
  type = string
}

variable "name" {
  type = string
}

variable "efs-subnet-1" {
  type = string
}

variable "efs-subnet-2" {
  type = string
}

variable "efs-sg" {
  type = list
}