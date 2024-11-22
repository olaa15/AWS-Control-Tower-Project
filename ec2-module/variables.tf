variable "instance_count" {
  description = "The number of EC2 instances to create."
  type        = number
  default     = 1
}

variable "ami" {
  description = "The AMI to use for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use."
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instances in."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instances."
  type        = list(string)
}

variable "instance_name_prefix" {
  description = "Prefix for the instance names."
  type        = string
  default     = "my-instance-"
}

variable "tags" {
  description = "A map of tags to assign to the instances."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data to provide when launching the instance."
  type        = string
  default     = null
}
