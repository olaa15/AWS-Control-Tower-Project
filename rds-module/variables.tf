variable "instance_count" {
  description = "The number of DB instances to create."
  type        = number
}

variable "db_instance_identifier" {
  description = "The database instance identifier."
  type        = string
}

variable "db_engine" {
  description = "The database engine to use."
  type        = string
}

variable "db_engine_version" {
  description = "The database engine version to use."
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the DB instance."
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in GiB."
  type        = number
}

variable "db_storage_type" {
  description = "The storage type for the DB instance."
  type        = string
}

variable "db_username" {
  description = "The master username for the DB instance."
  type        = string
}

variable "db_password" {
  description = "The master password for the DB instance."
  type        = string
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "multi_az" {
  description = "Determines whether to enable Multi-AZ."
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before destroying the DB instance."
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the DB instance."
  type        = list(string)
}

variable "db_subnet_group_description" {
  description = "The DB subnet group description."
  type        = string
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name."
  type        = string
}

variable "db_subnet_ids" {
  description = "The subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
}