terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Vault Provider configuration
provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = var.vault_token
}

# AWS Provider configuration
provider "aws" {
  region = var.aws_region
  # For testing, we'll use environment variables or AWS credentials file
}

# GCP Provider configuration
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  # For testing, we'll use environment variables or GCP credentials file
}

# AWS EC2 Instance
module "aws_compute" {
  source = "./modules/aws"

  instance_type = var.aws_instance_type
  ami_id        = var.aws_ami_id
  instance_name = var.instance_name
}

# GCP Compute Engine Instance
module "gcp_compute" {
  source = "./modules/gcp"

  machine_type  = var.gcp_machine_type
  instance_name = var.instance_name
  region        = var.gcp_region
}

# Example resource to test the configuration
resource "local_file" "example" {
  content  = "This is a test file created by Terraform"
  filename = "example.txt"
} 