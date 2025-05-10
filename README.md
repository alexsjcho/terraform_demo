# Terraform Demo Project

This project demonstrates the use of Terraform with AWS and GCP providers, using Vault for secrets management.

## Prerequisites

- Terraform >= 1.0.0
- AWS CLI configured with appropriate credentials
- Google Cloud SDK installed and configured
- Vault installed and running

## Setup

1. Copy the example environment file and update with your values:
   ```bash
   cp .env.example .env
   ```

2. Copy the example variables file and update with your values:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Start Vault in dev mode:
   ```bash
   vault server -dev
   ```

4. Set up your environment variables:
   ```bash
   source .env
   ```

5. Initialize Terraform:
   ```bash
   terraform init
   ```

6. Plan your changes:
   ```bash
   terraform plan
   ```

7. Apply your changes:
   ```bash
   terraform apply
   ```

## DEMO Scenarios

This project demonstrates key capabilities that address ACME Corp's multi-cloud transition needs:

### 1. Multi-Cloud Infrastructure as Code
- **Unified Configuration**: Single Terraform configuration managing both AWS and GCP resources
- **Consistent Resource Management**: Identical workflow for provisioning across different cloud providers
- **Code Reusability**: Modular design with shared variables and configurations
- **State Management**: Centralized state tracking across multiple cloud providers

### 2. Security and Secrets Management
- **HashiCorp Vault Integration**: Secure storage and management of sensitive data
- **Provider Credentials**: Secure handling of AWS and GCP credentials
- **Environment Variables**: Sensitive data managed through environment variables
- **Access Control**: Granular control over who can access and modify infrastructure

### 3. Infrastructure Components
- **Compute Resources**:
  - AWS EC2 instances with security groups
  - GCP Compute Engine instances with firewall rules
- **Networking**:
  - Automated security group/firewall configuration
  - Cross-cloud networking patterns
- **Resource Tagging**: Consistent resource naming and tagging across providers

### 4. Operational Benefits
- **Version Control**: Infrastructure changes tracked in Git
- **Collaboration**: Team-friendly configuration structure
- **Documentation**: Self-documenting infrastructure code
- **Reproducibility**: Consistent deployments across environments

### 5. Migration Path
- **Gradual Transition**: Ability to run AWS and GCP resources simultaneously
- **Resource Parity**: Similar resource types across providers
- **State Management**: No disruption during cloud provider changes
- **Cost Control**: Easy comparison of resource costs across providers

## Security Notes

- Never commit sensitive information to version control
- Keep your `.env` and `terraform.tfvars` files local and secure
- Use environment variables for sensitive data
- Regularly rotate your credentials and tokens

## Project Structure

```
.
├── modules/
│   ├── aws/          # AWS compute resources
│   └── gcp/          # GCP compute resources
├── .env.example      # Example environment variables
├── .gitignore        # Git ignore rules
├── main.tf           # Main Terraform configuration
├── variables.tf      # Variable definitions
└── terraform.tfvars.example  # Example variable values
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

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
- Sensitive information is stored in Vault and accessed securely by Terraform
