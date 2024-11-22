output "instance_ids" {
  description = "The IDs of the created EC2 instances."
  value       = aws_instance.test[*].id
}

output "instance_public_ips" {
  description = "The public IPs of the created EC2 instances."
  value       = aws_instance.this[*].public_ip
}