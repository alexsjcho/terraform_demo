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
