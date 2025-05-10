variable "vault_token" {
  description = "Vault token for authentication"
  type        = string
  sensitive   = true
}

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "terraform-se-demo"  # You can change this to your actual project ID
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "aws_instance_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "aws_ami_id" {
  description = "AWS AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0735c191cf914754d"  # Amazon Linux 2 in us-west-2
}

variable "gcp_machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-micro"
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "terraform-demo"
}

# Database variables
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
} 