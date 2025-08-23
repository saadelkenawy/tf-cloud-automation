provider "aws" {
    region = "us-east-1"
}

# create a vpc 
resource "aws_vpc" "lb2_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "lb2_vpc"
    }
  
}
#create internet gateway
resource "aws_internet_gateway" "lb2_igw" {
    vpc_id = aws_vpc.lb2_vpc.id

    tags = {
        Name = "lb2_igw"
    }
}

# create a s3 bucket
resource "aws_s3_bucket" "lb2-s3-saad-2025742338" {
    bucket = "lb2-s3-saad-2025742338"
    tags = {
      Name = "lb2-s3-saad-2025742338"
    }
  
}
# apply s3 bucket is private acl
resource "aws_s3_bucket_ownership_controls" "s3_control" {
    bucket = aws_s3_bucket.lb2-s3-saad-2025742338.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
  
}
resource "aws_s3_bucket_acl" "acl_s3" {
  depends_on = [ aws_s3_bucket_ownership_controls.s3_control ]
  bucket = aws_s3_bucket.lb2-s3-saad-2025742338.id
  acl   = "private"
}

# create a pupblic route table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.lb2_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lb2_igw.id
  }
  tags = {
    Name = "pub_rt"
  }
}
# this is valid code 
#===================================
# Create a security Group to allow tls port 443 
# resource "aws_security_group" "allow_tls" {
#     name = "allow_tls"
#     description = "allow tls inbound connection"
#     vpc_id = aws_vpc.lb2_vpc.id

#     ingress {
#         description = "TLS from anywhere"
#         from_port   = 443
#         to_port     = 443
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     tags = {
#       Name = "allow_tls_sg"
#       Environment = "test"
#     }
# }

# Create a security Group to allow tls port 443 
resource "aws_security_group" "allow_tls_v3" {
  name = "allow_tls_v3"
  description = "allow tls inbound connection"
  vpc_id = aws_vpc.lb2_vpc.id

  ingress {
        description = "TLS from anywhere"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls_v3_sg"
    Environment = "test"
  }
}

# this is valid code 
#===================================
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_ingress" {
#     security_group_id = aws_security_group.allow_tls_v2.id
#     cidr_ipv4 = "0.0.0.0/0"
#     from_port = 443
#     to_port = 443
#     ip_protocol = "tcp"
# }
