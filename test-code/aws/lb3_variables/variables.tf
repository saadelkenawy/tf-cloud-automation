variable "aws_region" {
  description = "default region is us-east-1"
  type = string
}

variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2"]
}

variable "cider" {
  description = "user input for cider applied new resource"
  type = string

}
variable "dns_support" {
    description = "select dns support true/false"
    type = bool
}

variable "dns_hostname" {
    description = "select dns hostname true/false"
    type = bool
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}