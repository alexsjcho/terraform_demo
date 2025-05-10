#!/bin/bash

# Start Vault server
vault server -config=vault-config.hcl &

# Wait for Vault to start
sleep 5

# Set environment variables
export VAULT_ADDR='http://127.0.0.1:8200'

# Initialize Vault
INIT_RESPONSE=$(vault operator init -key-shares=1 -key-threshold=1 -format=json)

# Extract root token and unseal key
UNSEAL_KEY=$(echo $INIT_RESPONSE | jq -r '.unseal_keys_b64[0]')
ROOT_TOKEN=$(echo $INIT_RESPONSE | jq -r '.root_token')

# Unseal Vault
vault operator unseal $UNSEAL_KEY

# Login with root token
vault login $ROOT_TOKEN

# Enable the KV secrets engine
vault secrets enable -version=2 kv

# Store AWS credentials
vault kv put kv/terraform/aws \
    access_key=AWS_ACCESS_KEY \
    secret_key=AWS_SECRET_KEY

# Store GCP credentials
vault kv put kv/terraform/gcp \
    project_id="terraform-se-demo" \
    credentials_json=GOOGLE_APPLICATION_CREDENTIALS

# Create a policy for Terraform
vault policy write terraform-policy - <<EOF
path "kv/data/terraform/*" {
  capabilities = ["read"]
}
EOF

# Create a token for Terraform
TERRAFORM_TOKEN=$(vault token create -policy=terraform-policy -format=json | jq -r '.auth.client_token')

# Save all environment variables to .env file
cat > .env << EOF
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='$TERRAFORM_TOKEN'
export AWS_ACCESS_KEY='$AWS_ACCESS_KEY'
export AWS_SECRET_KEY='$AWS_SECRET_KEY'
export GOOGLE_APPLICATION_CREDENTIALS='$GOOGLE_APPLICATION_CREDENTIALS'
EOF

echo "Vault has been initialized and configured!"
echo "Please save these values securely:"
echo "Unseal Key: $UNSEAL_KEY"
echo "Root Token: $ROOT_TOKEN"
echo "Environment variables have been saved to .env file"
echo ""
echo "To use these settings, run:"
echo "source .env"
