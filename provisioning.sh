#!/bin/bash

set -eo pipefail  # Exit on error

echo "========================================="
echo "Starting custom provisioning..."
echo "========================================="

# Update and install git
echo "Installing git..."
sudo apt-get update && sudo apt-get install -y git

. /venv/main/bin/activate
# Clone your repository
echo "Cloning repository..."
cd /workspace

# Replace with your actual repo URL
if [ ! -d "myrepo" ]; then
    git clone https://github.com/ankit-bhattarai/myosuite.git
    cd myosuite
else
    echo "Repository already exists, pulling latest..."
    cd myosuite
    git pull
fi
# Install Python package in editable mode
echo "Installing Python package..."
pip install -e .

# Optional: Install any other dependencies
# pip install -r requirements.txt

echo "========================================="
echo "Custom provisioning completed successfully!"
echo "========================================="

supervisorctl reload
