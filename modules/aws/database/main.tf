resource "aws_db_instance" "database" {
  identifier           = "${var.instance_name}-db"
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_name             = var.db_name
  username            = var.username
  password            = var.password
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.database.id]

  tags = {
    Name = "${var.instance_name}-db"
  }
}

resource "aws_security_group" "database" {
  name        = "${var.instance_name}-db-sg"
  description = "Security group for ${var.instance_name} database"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }

  tags = {
    Name = "${var.instance_name}-db-sg"
  }
} 