variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "public_subnet_count" {
  description = "Number of public subnets to create."
  type        = number
  default     = 1
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "private_subnet_count" {
  description = "Number of private subnets to create."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

