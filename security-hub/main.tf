# Enable the AWS Security Hub
resource "aws_securityhub_account" "test" {
  enable = true
}

# Enable integrations with AWS services
resource "aws_securityhub_product_subscription" "test {
  count = var.service_subscription_count

  product_arn = element(var.product_arns, count.index)

  depends_on = [aws_securityhub_account.test]
}

# Enable standard AWS Security Hub standards
resource "aws_securityhub_standards_subscription" "test" {
  for_each = toset(var.standard_arns)

  standard_arn = each.key

  depends_on = [aws_securityhub_account.test]
}