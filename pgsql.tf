resource "aws_db_instance" "postgres" {
  allocated_storage       = var.rds_allocated_storage
  backup_retention_period = var.rds_backup_retention_period
  backup_window           = var.rds_backup_window
  maintenance_window      = var.rds_maintenance_window
  db_name                 = var.rds_db_name
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  identifier              = var.rds_identifier
  username                = var.rds_username
  password                = var.rds_password
  storage_type            = var.rds_storage_type
  skip_final_snapshot     = true
  publicly_accessible     = true

  vpc_security_group_ids = [
    aws_security_group.postgres_sg.id
  ]

  tags = {
    Name        = var.rds_identifier
    Environment = var.rds_environment
  }
}

resource "aws_security_group" "postgres_sg" {
  name        = "${var.rds_identifier}-sg"
  description = "Security group for PostgreSQL."

  ingress {
    description = "Allow PostgreSQL inbound traffic."
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}