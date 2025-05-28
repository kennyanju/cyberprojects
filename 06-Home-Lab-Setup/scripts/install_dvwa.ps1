<#
.SYNOPSIS
    Installs DVWA (Damn Vulnerable Web App) on a Linux system using PowerShell 7.
.DESCRIPTION
    Automates the installation of Apache, PHP, MariaDB, and DVWA for lab use.
.NOTES
    Requires PowerShell 7+ and sudo/root privileges.
#>

function Log {
    param([string]$Message)
    Write-Host "[INFO] $Message"
}

# Check for root privileges
if ($EUID -ne 0 -and $env:SUDO_USER -eq $null) {
    Write-Error "This script must be run as root (sudo pwsh)."
    exit 1
}

Log "Updating package list..."
sudo apt update

Log "Installing required packages..."
sudo apt install -y apache2 php php-mysqli git mariadb-server

$dvwaDir = "/var/www/html/dvwa"
if (-not (Test-Path $dvwaDir)) {
    Log "Cloning DVWA repository..."
    git clone https://github.com/digininja/DVWA.git $dvwaDir
} else {
    Log "DVWA already exists. Skipping clone."
}

Set-Location $dvwaDir

$configPath = "config/config.inc.php"
if (-not (Test-Path $configPath)) {
    Log "Copying default config file..."
    cp config/config.inc.php.dist config/config.inc.php
} else {
    Log "Config file already exists. Skipping copy."
}

Log "Setting permissions..."
sudo chown -R www-data:www-data $dvwaDir

Log "Restarting Apache..."
sudo systemctl restart apache2

Log "DVWA installation complete. Please configure your database and security settings as needed."