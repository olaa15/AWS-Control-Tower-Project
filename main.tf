
# VPC MAIN.TF

/*
provider "aws" {
  region = "us-east-1"  # Specify the AWS region
}

# Use the VPC module
module "vpc" {
  source = "./terraform-vpc-module"  # Path to your VPC module

  vpc_name            = "my-vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = [
    "10.0.1.0/24",  # CIDR for public subnet 1
    "10.0.2.0/24",  # CIDR for public subnet 2
  ]
  public_subnet_count = 2  # Number of public subnets to create

  private_subnet_cidrs = [
    "10.0.3.0/24",  # CIDR for private subnet 1
    "10.0.4.0/24",  # CIDR for private subnet 2
  ]
  private_subnet_count = 2  # Number of private subnets to create

  tags = {
    Environment = "test"
    Project     = "Control-Tower"
  }
}

# Outputs from the module
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the created public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the created private subnets."
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}
*/

# EC2 MAIN.TF
/*
module "ec2_instances" {
  source              = "./terraform-ec2-instance-module"
  instance_count     = 3
  ami                 = "ami-0123456789abcdef0"  # Replace with a valid AMI ID
  instance_type      = "t2.micro"
  key_name            = "your-key-name"          # Replace with your key name
  subnet_id          = "subnet-0123456789abcdef0"  # Replace with your subnet ID
  security_group_ids = ["sg-0123456789abcdef0"]  # Replace with valid security group IDs
  instance_name_prefix = "web-server-"
  tags = {
    Environment = "test"
    Project     = "Control-Tower"
  }
}
*/


# S3 BUCKET MAIN.TF
/*
# Define the bucket names for different environments
variable "bucket_names" {
  type = list(string)
  default = [
    "Control-Tower-test-bucket",
    "Control-Tower-bucket",
    "Control-Tower-preprod-bucket",
    "Control-Tower-prod-bucket"
  ]
}

# Loop through the bucket names and create S3 buckets using the module
resource "null_resource" "create_active_buckets" {
  count = length(var.bucket_names)

  # Use the S3 bucket module to create the buckets
  provisioner "local-exec" {
    command = "terraform apply -target=aws_s3_bucket.this[${count.index}]"
  }
}

module "s3_buckets" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_names[count.index]  # Use count.index to reference bucket names
  count       = length(var.bucket_names)        # Create a bucket for each environment
}



provider "aws" {
  region = "us-west-2"  # Change to your desired AWS region
}

module "database" {
  source                      = "./modules/db_instance"
  instance_count             = 2  # Number of instances you want to create
  db_instance
}
*/

# RDS MAIN.TF
/*

# Use the RDS module
module "rds" {
  source              = "./terraform-rds-module"
  instance_count     = 2                                # Number of RDS instances to create
  engine             = "mysql"                           # Database engine
  engine_version      = "8
}
*/


# Audit-Manager MAIN.TF
/*
module "audit_manager" {
  source                = "./modules/aws_audit_manager"  # Path to your module
  framework_name        = "MyComplianceFramework"
  framework_description = "A framework for compliance audits."
  compliance_type       = "PCI-DSS"  # Example compliance type
  control_set_name      = "Security Controls"

  # List of controls to add to the framework
  controls = [
    {
      control_id          = "C1"
      control_name        = "Firewall Configuration"
      control_description = "Ensure that firewalls are configured correctly."
      control_data_source  = "AWS CloudTrail"
    },
    {
      control_id          = "C2"
      control_name        = "User Access Control"
      control_description = "Verify user access levels and settings are correctly configured."
      control_data_source  = "AWS IAM"
    },
    {
      control_id          = "C3"
      control_name        = "Data Backup"
      control_description = "Check that backups are configured and operational."
      control_data_source  = "AWS Backup"
    }
  ]

  assessment_name        = "Annual Compliance Assessment"
}

output "audit_framework_id" {
  value = module.audit_manager.aws_auditmanager_framework.id
}
*/
