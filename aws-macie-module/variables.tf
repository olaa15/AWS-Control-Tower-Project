variable "bucket_count" {
  description = "The number of S3 buckets to associate with Macie."
  type        = number
  default     = 1
}

variable "bucket_arns" {
  description = "A list of ARNs for the S3 buckets to be associated with Macie."
  type        = list(string)
}

variable "finding_types" {
  description = "The types of findings to be included in Macie."
  type        = list(string)
  default     = ["SensitiveData"]
}