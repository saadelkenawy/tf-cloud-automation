provider "aws" {
  region = "us-east-1"
}
# creating a vpc
resource "aws_vpc" "tf-vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "tf-vpc"
    }
}
# Creating S3 bucket 
resource "aws_s3_bucket" "saad_s3_bucket" {
  bucket = "saad-s3-bucket-147852"
  tags = {
    Name = "saad-s3-bucket"
    created_by = "Terraform"
  }
}
# apply s3 bucket acl is private 

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = aws_s3_bucket.saad_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.bucket_ownership_controls ]
  bucket = aws_s3_bucket.saad_s3_bucket.id
  acl    = "private"
}

# Create a Security group for TLS
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "allow tls for inbound connection"
  vpc_id     = aws_vpc.tf-vpc.id
  tags = {
    Name = "allow_tls"
  }
}
# Allow inbound traffic on port 443 (HTTPS) Ingress
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
 security_group_id = aws_security_group.allow_tls.id
 cidr_ipv4 = "0.0.0.0/0"
 ip_protocol = "tcp"
 from_port = 443
 to_port = 443
  tags = {
    Name = "allow_tls"
    Created_by = "Terraform"
    Type = "ingress"
  }
}

# Allow all outbound traffic Egress 
resource "aws_vpc_security_group_egress_rule" "default_egress" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  tags = {
    Name = "allow_tls"
    Created_by = "Terraform"
    Type = "egress"
  }
}