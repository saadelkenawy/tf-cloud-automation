provider "aws" {
  region = var.aws_region
}

# create a vpc 
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.cider

  tags = {
    Name = "tf-vpc"
  }


}

resource "aws_subnet" "name" {
  
}