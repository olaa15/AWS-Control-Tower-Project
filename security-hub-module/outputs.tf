output "security_hub_account_id" {
  description = "The ID of the AWS Security Hub account."
  value       = aws_securityhub_account.this.id
}

output "product_subscriptions" {
  description = "The list of product subscriptions for the AWS Security Hub."
  value       = aws_securityhub_product_subscription.this[*].product_arn
}

output "enabled_standards" {
  description = "The list of standards enabled in AWS Security Hub."
  value       = aws_securityhub_standards_subscription.this[*].standard_arn
}

