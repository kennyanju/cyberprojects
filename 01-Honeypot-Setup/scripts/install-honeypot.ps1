<#
.SYNOPSIS
    Installs and configures the Cowrie honeypot on a Linux system using PowerShell 7.
.DESCRIPTION
    This script automates the installation of Cowrie, its dependencies, and starts the service.
    Must be run as root (sudo pwsh).
#>

function Log {
    param([string]$Message)
    Write-Host "[INFO] $Message"
}

# Ensure script is running as root
if ($EUID -ne 0 -and $env:SUDO_USER -eq $null) {
    Write-Error "This script must be run as root (sudo pwsh)."
    exit 1
}

# Update package list
Log "Updating package list..."
sudo apt update

# Install required packages
Log "Installing required packages..."
sudo apt install -y git python3-pip

# Clone Cowrie repository if it doesn't already exist
$cowrieDir = "/opt/cowrie"
if (-not (Test-Path $cowrieDir)) {
    Log "Cloning Cowrie repository..."
    git clone https://github.com/cowrie/cowrie.git $cowrieDir
} else {
    Log "Cowrie repository already exists. Skipping clone."
}

# Navigate to Cowrie directory
Set-Location $cowrieDir

# Install Python dependencies
Log "Installing Python dependencies..."
pip3 install --upgrade pip
pip3 install -r requirements.txt

# Copy configuration file if it doesn't already exist
$cfgPath = "etc/cowrie.cfg"
if (-not (Test-Path $cfgPath)) {
    Log "Copying default configuration file..."
    Copy-Item "etc/cowrie.cfg.dist" $cfgPath
} else {
    Log "Configuration file already exists. Skipping copy."
}

# Start Cowrie
Log "Starting Cowrie..."
bin/cowrie start

Log "Cowrie installation and setup complete."