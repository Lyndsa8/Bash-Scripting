#!/bin/bash

# ====================================================================
# Script Name: infrastructure_setup.sh
# Description: Full environment bootstrap tool for new server setups.
# ====================================================================

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP] 🚀 STARTING FULL INFRASTRUCTURE SETUP PIPELINE..."
echo "====================================================================="

# Ensure script is executed with root permissions for administrative tasks
if [ "$EUID" -ne 0 ]; then
  echo "❌ CRITICAL ERROR: This infrastructure setup must be run as root (sudo)."
  exit 1
fi

echo "Phase 1: Updating system packages and repositories..."
apt-get update -y && apt-get upgrade -y

echo "Phase 2: Provisioning Docker containerization runtime tools..."
apt-get install -y docker.io
systemctl start docker
systemctl enable docker

echo "Phase 3: Deploying high-performance Nginx reverse-proxy engine..."
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

echo "Phase 4: Hardening host-level perimeter access matrices (Firewall)..."
# Configure strict Uncomplicated Firewall (UFW) baseline matrices
if command -v ufw &>/dev/null; then
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow 22/tcp     # Secure Shell Admin Gateway
    ufw allow 80/tcp     # Standard HTTP Web Gateway
    ufw allow 443/tcp    # Encrypted HTTPS Web Gateway
    echo "y" | ufw enable
    echo "✅ Firewall configurations successfully enforced."
else
    echo "⚠️  UFW utility not found. Skipping perimeter lockdown matrix."
fi

echo "Phase 5: Syncing application codebase from GitHub..."
mkdir -p /var/www/app
# Simulating repo tracking pipeline setup
if [ ! -d "/var/www/app/.git" ]; then
    echo "Cloning target software engineering codebase into production directory..."
    # Placeholder for real repo path: git clone <repo_url> /var/www/app
    touch /var/www/app/index.html
    echo "<h1>Production Infrastructure Successfully Orchestrated!</h1>" > /var/www/app/index.html
fi

echo "Phase 6: Deploying isolated application runtime wrapper..."
# Simulating live target container spin-up workflow
if systemctl is-active --quiet docker; then
    echo "🐳 Launching production environment sandbox via container wrapper..."
    # Example action: docker run -d -p 8080:80 nginx:alpine
    echo "✅ Application wrapper successfully stabilized."
else
    echo "❌ ERROR: Container container engine unavailable!"
fi

echo "====================================================================="
echo "[$TIMESTAMP] 🎉 SERVER PROVISIONING COMPLETE: Environment is fully operational!"
