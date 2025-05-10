#!/bin/bash

# Function to start Vault
start_vault() {
    echo "Starting Vault server..."
    vault server -config=vault-config.hcl &
    sleep 5
    echo "Vault server started"
}

# Function to stop Vault
stop_vault() {
    echo "Stopping Vault server..."
    pkill -f "vault server"
    echo "Vault server stopped"
}

# Function to unseal Vault
unseal_vault() {
    if [ -z "$1" ]; then
        echo "Please provide the unseal key"
        exit 1
    fi
    echo "Unsealing Vault..."
    vault operator unseal $1
}

# Function to check Vault status
check_vault() {
    echo "Checking Vault status..."
    vault status
}

# Function to load environment
load_env() {
    if [ -f .env ]; then
        echo "Loading environment variables..."
        source .env
        echo "Environment loaded"
    else
        echo "No .env file found"
        exit 1
    fi
}

# Main script
case "$1" in
    "start")
        start_vault
        ;;
    "stop")
        stop_vault
        ;;
    "unseal")
        unseal_vault $2
        ;;
    "status")
        check_vault
        ;;
    "env")
        load_env
        ;;
    *)
        echo "Usage: $0 {start|stop|unseal|status|env}"
        exit 1
        ;;
esac 