#!/bin/bash

set -e

# Function to log messages
log() {
    echo "[INFO] $1"
}

log "Updating package list..."
sudo apt update

log "Installing required packages..."
sudo apt install -y apache2 php php-mysqli git mariadb-server

# Clone DVWA if not already present
if [ ! -d "/var/www/html/dvwa" ]; then
    log "Cloning DVWA repository..."
    sudo git clone https://github.com/digininja/DVWA.git /var/www/html/dvwa
else
    log "DVWA already exists. Skipping clone."
fi

cd /var/www/html/dvwa

# Copy config file if not already present
if [ ! -f "config/config.inc.php" ]; then
    log "Copying default config file..."
    sudo cp config/config.inc.php.dist config/config.inc.php
else
    log "Config file already exists. Skipping copy."
fi

# Set permissions
log "Setting permissions..."
sudo chown -R www-data:www-data /var/www/html/dvwa

# Restart Apache
log "Restarting Apache..."
sudo systemctl restart apache2

log "DVWA installation complete. Please configure your database and security settings as needed."