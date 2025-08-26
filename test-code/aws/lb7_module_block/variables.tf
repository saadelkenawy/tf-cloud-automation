variable "aws_region" {
  description = "default region is us-east-1"
  type = string
  default = "us-east-1"
}

variable "def_prod" {
  description = "production"
  type = string
  default = "prod"

}

variable "def_remote_user" {
  description = "remote user"
  type = string
  default = "Terraform"
}

variable "def_dev" {
  description = "development"
  type = string
  default = "dev"
  
}

variable "def_pri" {
  description = "private"
  type = string
  default = "pri"
}

variable "def_pub" {
  description = "public"
  type = string
  default = "pub"
  
}


variable "regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2"]
}

variable "vpc_cidr" {
  description = "user input for cidr applied new resource"
  type = string
  default = "10.0.0.0/16"


}

variable "pub_sub_cidr" {
  description = "user input for public subnet cidr applied new resource"
  type = string
  default = "10.0.100.0/24"

}

variable "pri_sub_cidr" {
  description = "user input for private subnet cidr applied new resource"
  type = string
  default = "10.0.1.0/24"

}
variable "dns_support" {
    description = "select dns support true/false"
    type = bool
    default = false
}

variable "dns_hostname" {
    description = "select dns hostname true/false"
    type = bool
    default = false
}

variable "Az" {
    description = "availability zone List : us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1e , us-east-1f"
    type        = list(string)
    default = [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e" , "us-east-1f" ]
}

variable "public_ip_on_launch" {
  description = "Allocate a public IP address on instance launch"
  type        = bool
  default = false
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = map(number)
  default  = {
    subnet1 = 0
    subnet2 = 1
    subnet3 = 2
  }
}