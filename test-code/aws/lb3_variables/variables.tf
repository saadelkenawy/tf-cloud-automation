variable "aws_region" {
  description = "default region is us-east-1"
  type = string
}

variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2"]
}

variable "cidr" {
  description = "user input for cidr applied new resource"
  type = string

}

variable "pub_sub_cidr" {
  description = "user input for public subnet cidr applied new resource"
  type = string

}

variable "pri_sub_cidr" {
  description = "user input for private subnet cidr applied new resource"
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

variable "Az" {
    description = "availability zone"
    type        = list(string)
    default = [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e" , "us-east-1f" ]
}

variable "public_ip_on_launch" {
  description = "Allocate a public IP address on instance launch"
  type        = bool
}