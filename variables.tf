##################################################
# Amazon Web Services (AWS)
##################################################

variable "aws_region" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "The name of the selected region."
}

variable "aws_access_key" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Specifies an AWS access key associated with an IAM account."
}

variable "aws_secret_key" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Specifies the secret key associated with the access key."
}

##################################################
# Elastic Compute Cloud (EC2)
##################################################

variable "ec2_name" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Instance name."
}

variable "ec2_environment" {
  type        = string
  default     = "Development environment"  // <= TODO - Enter variable value.
  description = "Instance environment."
}

variable "ec2_aws_key_pair_key_name" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "The name for the key pair."
}

variable "ec2_ami" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "ID of Amazon Machine Image (AMI) to use for the instance."
}

variable "ec2_instance_type" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Type of the Instance."
}

variable "ec2_volume_size" {
  type        = number
  default     = "" // <= TODO - Enter variable value.
  description = "The volume size in gigabytes."
}

variable "ec2_volume_type" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of SSD), or 'io1' (provisioned IOPS SSD)."
}

variable "ec2_init_sh_local" {
  type        = string
  default     = "./bash/init.sh"
  description = "Path to local init bash script for EC2."
}

variable "ec2_init_sh_remote" {
  type        = string
  default     = "/tmp/init.sh"
  description = "Path to remote init bash script for EC2."
}

variable "ec2_ssh_key_file_name" {
  type        = string
  default     = "admin.pem"
  description = "Public EC2 SSH key file name."
}

variable "ec2_connection_type" {
  type        = string
  default     = "ssh"
  description = "The connection type. Valid values are 'ssh' and 'winrm'."
}

variable "ec2_connection_user" {
  type        = string
  default     = "admin"
  description = "The user to use for the connection."
}

variable "ec2_connection_timeout" {
  type        = string
  default     = "30s"
  description = "The timeout to wait for the connection to become available. Should be provided as a string."
}

variable "ec2_tls_private_key_algorithm" {
  type        = string
  default     = "ECDSA"
  description = "The name of the algorithm to use for the key. Currently-supported values are 'RSA' and 'ECDSA'."
}

variable "ec2_tls_private_key_ecdsa_curve" {
  type        = string
  default     = "P521"
  description = "When algorithm is ECDSA, the name of the elliptic curve to use. Currently-supported values are: P224, P256, P384, P521. (default: P224)"
}

##################################################
# Relational Database Service (RDS)
##################################################

variable "rds_identifier" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Instance name."
}

variable "rds_environment" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Instance environment."
}

variable "rds_engine" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Provides the name of the database engine to be used for this DB instance."
}

variable "rds_engine_version" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Database engine version."
}

variable "rds_username" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Username for the master DB user."
}

variable "rds_password" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}

variable "rds_db_name" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "The DB name to create. If omitted, no database is created initially."
}

variable "rds_instance_class" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "General purpose family and has 2 vCPUs, 8 GiB of memory and up to 5 Gibps of bandwidth"
}

variable "rds_backup_retention_period" {
  type        = number
  default     = "" // <= TODO - Enter variable value.
  description = "The days to retain backups for."
}

variable "rds_backup_window" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window."
}

variable "rds_maintenance_window" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:01:00-Mon:03:00'."
}

variable "rds_storage_type" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter."
}

variable "rds_allocated_storage" {
  type        = number
  default     = "" // <= TODO - Enter variable value.
  description = "The allocated storage in gigabytes."
}

##################################################
# Route 53
##################################################

variable "route_53_domain" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "This is the name of the hosted zone."
}

variable "route_53_environment" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Instance environment."
}

variable "route_53_description" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Instance description."
}

##################################################
# Simple Storage Service (S3)
##################################################

variable "s3_bucket" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Name of the bucket."
}

variable "s3_tag_name" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Bucket description."
}

variable "s3_tag_environment" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Bucket environment."
}

variable "s3_object_key" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Name of the object once it is in the bucket."
}

variable "s3_object_file_path" {
  type        = string
  default     = "" // <= TODO - Enter variable value.
  description = "Bucket environment."
}
