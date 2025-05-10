# Terraform Multi-Cloud Compute Demo

This Terraform configuration demonstrates how to provision compute instances on both AWS EC2 and Google Cloud Platform (GCP) Compute Engine.

## Prerequisites

1. Install [Terraform](https://www.terraform.io/downloads.html) (version 1.0.0 or later)
2. AWS CLI configured with appropriate credentials
3. GCP CLI configured with appropriate credentials
4. AWS account with appropriate permissions
5. GCP project with billing enabled

## Configuration

1. Create a `terraform.tfvars` file with your specific values:

```hcl
aws_region        = "us-west-2"
gcp_project_id    = "your-gcp-project-id"
gcp_region        = "us-central1"
instance_name     = "terraform-demo"
```

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. When you're done, destroy the resources:
```bash
terraform destroy
```

## Resources Created

### AWS
- EC2 instance (t2.micro by default)
- Security group allowing SSH access

### GCP
- Compute Engine instance (e2-micro by default)
- Firewall rule allowing SSH access

## Notes

- The default configurations use small instance types suitable for testing
- SSH access is enabled from any IP (0.0.0.0/0) for demonstration purposes
- In production, you should restrict SSH access to specific IP ranges
- Both instances use default VPC networks
