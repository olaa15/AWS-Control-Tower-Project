output "macie_session_id" {
  description = "The ID of the Amazon Macie session."
  value       = aws_macie_session.this.id
}

output "s3_bucket_association_ids" {
  description = "The IDs of the associated S3 buckets."
  value       = aws_macie_s3_bucket_association.this[*].id
}