variable "Region" {
  description = "Region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "enable_vpc_hostname" {
    description = "Enable VPC DNS hostnames"
    type        = bool
    default     = true
}

variable "enable_vpc_dns_support" {
    description = "Enable VPC DNS support"
    type        = bool
    default     = true
  
}
