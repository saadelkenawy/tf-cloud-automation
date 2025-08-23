provider "aws" {
  region = var.aws_region
}

# create a vpc 
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.cidr
  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostname

  tags = {
    Name = "tf_vpc"
  }
}
resource "aws_subnet" "pub_sub" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = var.pub_sub_cidr
  availability_zone = var.Az[0]
  map_public_ip_on_launch = var.public_ip_on_launch

  tags = {
    Name = "tf_public_subnet"
  }
}


resource "aws_subnet" "pri_sub" {
  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = var.pri_sub_cidr
  availability_zone = var.Az[0]

  tags = {
    Name = "tf_private_subnet"
  }
}


  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
      Name = "tf_igw"
    }

  }