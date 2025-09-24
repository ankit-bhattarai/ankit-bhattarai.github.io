#!/bin/bash
set -e  # Exit on error

echo "========================================="
echo "Starting custom provisioning..."
echo "========================================="

# Update and install git
echo "Installing git..."
apt-get update && apt-get install -y git

# Clone your repository
echo "Cloning repository..."
cd /workspace

# Replace with your actual repo URL
if [ ! -d "myrepo" ]; then
    git clone https://github.com/ankit-bhattarai/myosuite
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
