provider "aws" {
  region = var.aws_region
}

locals {
  timestamp = timestamp()
  vpc_name  = "${var.def_prod}_tfvpc"
  remote_user = "${var.def_remote_user}_User"
  subnet_pri = "${var.def_pri}_subnet"
  subnet_pub = "${var.def_pub}_subnet"

}

# create a vpc 
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostname

  tags = {
    Name = local.vpc_name
    user = local.remote_user

  }
}
resource "aws_subnet" "pub_sub" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = var.pub_sub_cidr
  availability_zone = var.Az[0]
  map_public_ip_on_launch = var.public_ip_on_launch

  tags = {
    Name = local.subnet_pub
  }
}


resource "aws_subnet" "pri_sub" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = var.pri_sub_cidr
  availability_zone = var.Az[0]

  tags = {
    Name = local.subnet_pri
  }
}




  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
      Name = "tf_igw"
    }

  }