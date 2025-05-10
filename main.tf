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
  }
}

# AWS Provider configuration
provider "aws" {
  region = var.aws_region
}

# GCP Provider configuration
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
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

  machine_type = var.gcp_machine_type
  image_family = var.gcp_image_family
  instance_name = var.instance_name
} 