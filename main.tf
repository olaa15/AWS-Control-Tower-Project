
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

/*
# Macie module
module "macie" {
  source       = "./terraform-macie-module"  # Path to your Macie module

  bucket_count = 1  # Number of S3 buckets to associate
  bucket_arns  = [
    "arn:aws:s3:::your-s3-bucket-name"  # Replace with the ARN of your S3 bucket
  ]
  finding_types = ["SensitiveData", "PolicyViolations"]
}

# Outputs from the Macie module
output "macie_session_id" {
  description = "The ID of the Amazon Macie session."
  value       = module.macie.macie_session_id
}

output "s3_bucket_association_ids" {
  description = "The IDs of the associated S3 buckets."
  value       = module.macie.s3_bucket_association_ids
}
*/

# Security-Hub
/*
# Use the Security Hub module
module "security_hub" {
  source                       = "./terraform-security-hub-module"  # Path to your Security Hub module

  service_subscription_count   = 1  # Number of services to subscribe to
  product_arns                 = [
    "arn:aws:securityhub:::product/aws/guardduty",  # Example product ARN for GuardDuty
    "arn:aws:securityhub:::product/aws/config",      # Example product ARN for Config
  ]

  standard_arns = [
    "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0",
    "arn:aws:securityhub:us-east-1::standards/aws-iam-access-analyzer/v/1.0.0"
  ]
}

# Outputs from the Security Hub module
output "security_hub_account_id" {
  description = "The ID of the AWS Security Hub account."
  value       = module.security_hub.security_hub_account_id
}

output "product_subscriptions" {
  description = "The list of product subscriptions for the AWS Security Hub."
  value       = module.security_hub.product_subscriptions
}

output "enabled_standards" {
  description = "The list of standards enabled in AWS Security Hub."
  value       = module.security_hub.enabled_standards
}
*/

#CloudWatch
/* 
module "cloudwatch" {
  source                    = "./terraform-cloudwatch-module"  # Path to your CloudWatch module
  create_log_group          = true                              # Whether to create a log group
  log_group_name            = "my-log-group"                   # Name of the log group
  log_stream_name           = "my-log-stream"                  # Name of the log stream
  create_metric_filter      = true                              # Whether to create a metric filter
  metric_filter_name        = "my-metric-filter"               # Name of the metric filter
  metric_filter_pattern     = "{ $.level = \"ERROR\" }"        # Example pattern for the metric filter
  metric_transformation_name = "my-metric-transformation"       # Name of the metric transformation
  metric_namespace          = "MyNamespace"                     # Namespace for the metric
  metric_transformation_value = "1"                            # Value for the metric transformation
  alarm_name                = "my-alarm"                       # Name of the alarm
  comparison_operator       = "GreaterThanThreshold"            # Comparison operator for the alarm
  evaluation_periods        = 1                                  # Number of periods for evaluation
  metric_name               = "my-metric"                       # Name of the watched metric
  period                    = 60                                 # The period in seconds
  statistic                 = "Sum"                              # Statistic to apply
  threshold                 = 1                                  # Threshold for the alarm
  alarm_description         = "Trigger when errors occur"       # Description for the alarm
  actions_enabled           = true                               # Whether to enable actions
  alarm_actions             = []                                 # List of actions for the alarm
  insufficient_data_actions = []                                 # Actions for insufficient data
  ok_actions                = []                                 # Actions for OK state
}

# Outputs from the CloudWatch module
output "log_group_name" {
  description = "The name of the CloudWatch Log Group."
  value       = module.cloudwatch.log_group_name
}

output "log_stream_name" {
  description = "The name of the CloudWatch Log Stream."
  value       = module.cloudwatch.log_stream_name
}

output "metric_filter_name" {
  description = "The name of the created Metric Filter."
  value       = module.cloudwatch.metric_filter_name
}

output "alarm_name" {
  description = "The name of the created CloudWatch Alarm."
  value       = module.cloudwatch.alarm_name
}
*/
