resource "aws_db_instance" "test" {
  count                   = var.instance_count
  identifier              = var.db_instance_identifier
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  storage_type           = var.db_storage_type
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  multi_az               = var.multi_az
  skip_final_snapshot    = var.skip_final_snapshot

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = merge(var.tags, {
    Name = var.db_instance_identifier
  })

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_db_subnet_group" "this" {
  db_subnet_group_description = var.db_subnet_group_description
  name                        = var.db_subnet_group_name
  subnet_ids                  = var.db_subnet_ids

  tags = merge(var.tags, {
    Name = var.db_subnet_group_name
  })
}