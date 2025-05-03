#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display messages
log() {
    echo "[INFO] $1"
}

# Update package list
log "Updating package list..."
sudo apt update

# Install required packages
log "Installing required packages..."
sudo apt install -y git python3-pip

# Clone Cowrie repository if it doesn't already exist
if [ ! -d "/opt/cowrie" ]; then
    log "Cloning Cowrie repository..."
    git clone https://github.com/cowrie/cowrie.git /opt/cowrie
else
    log "Cowrie repository already exists. Skipping clone."
fi

# Navigate to Cowrie directory
cd /opt/cowrie

# Install Python dependencies
log "Installing Python dependencies..."
pip3 install --upgrade pip
pip3 install -r requirements.txt

# Copy configuration file if it doesn't already exist
if [ ! -f "etc/cowrie.cfg" ]; then
    log "Copying default configuration file..."
    cp etc/cowrie.cfg.dist etc/cowrie.cfg
else
    log "Configuration file already exists. Skipping copy."
fi

# Start Cowrie
log "Starting Cowrie..."
bin/cowrie start

log "Cowrie installation and setup complete."
