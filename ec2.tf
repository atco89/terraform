provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "webserver" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_aws_key_pair_key_name
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  depends_on             = [aws_key_pair.aws-key-public]

  provisioner "file" {
    source      = var.ec2_init_sh_local
    destination = var.ec2_init_sh_remote
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0777 ${var.ec2_init_sh_remote}",
      "sudo ${var.ec2_init_sh_remote}",
      "rm -f ${var.ec2_init_sh_remote}",
    ]
  }

  connection {
    type        = var.ec2_connection_type
    host        = aws_instance.webserver.public_ip
    user        = var.ec2_connection_user
    private_key = tls_private_key.ecdsa-key.private_key_pem
    timeout     = var.ec2_connection_timeout
  }

  root_block_device {
    volume_size           = var.ec2_volume_size
    volume_type           = var.ec2_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = var.ec2_name
    Environment = var.ec2_environment
  }
}

resource "aws_security_group" "webserver_sg" {
  name        = "${var.ec2_name}-sg"
  description = "Security group for EC2."

  ingress {
    description = "Allow SSH inbound traffic."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS inbound traffic."
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "ecdsa-key" {
  algorithm = var.ec2_tls_private_key_algorithm
  ecdsa_curve = var.ec2_tls_private_key_ecdsa_curve
}

resource "local_file" "aws-key-private" {
  content  = tls_private_key.ecdsa-key.private_key_pem
  filename = "${path.module}/certs/${var.ec2_ssh_key_file_name}"
}

resource "aws_key_pair" "aws-key-public" {
  key_name   = var.ec2_aws_key_pair_key_name
  public_key = tls_private_key.ecdsa-key.public_key_openssh
}

##################################################
# Output variables
##################################################

output "instance_ip_addr" {
  value = aws_instance.webserver.public_ip
}

output "rds_ip_address" {
  value = aws_db_instance.postgres.address
}

output "rds_username" {
  value = aws_db_instance.postgres.username
}

output "rds_password" {
  value = aws_db_instance.postgres.password
}

output "rds_database" {
  value = aws_db_instance.postgres.db_name
}

output "file_version" {
  value = aws_s3_object.object.version_id
}