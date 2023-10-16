variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  type = string
  description = "company name"
}

variable "vpc_id" {
  description = "aws_vpc.main.id"
}