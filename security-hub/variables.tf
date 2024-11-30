variable "service_subscription_count" {
  description = "Number of AWS services to subscribe to."
  type        = number
  default     = 1
}

variable "product_arns" {
  description = "A list of product ARNs for integration with AWS Security Hub."
  type        = list(string)
}

variable "standard_arns" {
  description = "A set of ARNs for the AWS Security Hub standards to enable."
  type        = set(string)
  default     = []
}
