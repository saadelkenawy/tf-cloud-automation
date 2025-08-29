output "vpc_id" {
    description = "The ID of the VPC"
    value       = "${aws_vpc.tf_vpc.id} - ${aws_vpc.tf_vpc.cidr_block} - ${aws_vpc.tf_vpc.tags["Name"]}"

}

output "Terraform_code" {
    description = "Hello from Terraform code"
    value = "Hello this is Outputs file refrences"
}