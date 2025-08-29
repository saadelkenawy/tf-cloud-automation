provider "aws" {
  region = var.Region
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enable_vpc_hostname
  enable_dns_support = var.enable_vpc_dns_support

  tags = {
    Name = "tf_vpc"
    User = "Terraform"
  } 
}

