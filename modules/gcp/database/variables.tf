variable "instance_name" {
  description = "Name of the database instance"
  type        = string
}

variable "database_version" {
  description = "Database version"
  type        = string
  default     = "POSTGRES_14"
}

variable "machine_type" {
  description = "Machine type for the database instance"
  type        = string
  default     = "db-f1-micro"
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "app_network" {
  description = "Network CIDR of the application instance"
  type        = string
} 