output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "The IDs of the created public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the created private subnets."
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}