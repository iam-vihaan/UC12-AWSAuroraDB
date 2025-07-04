# Outputs from the VPC module

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.demo-vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}
