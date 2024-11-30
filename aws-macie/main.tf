resource "aws_macie_s3_bucket_association" "test" {
  count                = var.bucket_count
  bucket_arn          = var.bucket_arns[count.index]
  finding_type        = var.finding_types

  depends_on = [aws_macie_session.test]
}

resource "aws_macie_session" "test" {
  status = "ENABLED" 
}