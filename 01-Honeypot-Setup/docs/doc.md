# Honeypot Setup Documentation

## Overview

This documentation explains the structure and usage of the **Honeypot Setup** folder. The project provides scripts and templates to deploy and configure a Cowrie honeypot on a Linux system (such as an Azure VM), with options for automation and integration with security monitoring tools.

---

## Folder Structure

- **`scripts/`**
  - Contains automation scripts for installing and configuring the Cowrie honeypot.
    - `install-honeypot.sh`: Bash script to automate the installation and setup of Cowrie.
    - `install-honeypot.py`: Python script alternative for automated Cowrie deployment.
    - `install-honeypot.ps1`: PowerShell 7 script for Cowrie installation (for PowerShell users on Linux).
- **`arm-template/`**
  - Contains Azure Resource Manager (ARM) templates for deploying a honeypot VM in Azure.
    - `template.json`: Parameterized ARM template for VM deployment.
- **`sentinel-integration/`**
  - Includes KQL queries and integration instructions for Microsoft Sentinel.
    - `kql-queries.txt`: Example queries for detecting honeypot activity in Sentinel.
- **`docs/`**
  - Additional documentation, usage notes, and references.

---

## Quick Start

### 1. Deploy a VM (Optional, for Azure)

- Use the ARM template in `arm-template/template.json` to deploy a Linux VM suitable for running Cowrie.
- Example command:
  ```bash
  az deployment group create \
    --resource-group <your-resource-group> \
    --template-file arm-template/template.json    git add .
    git commit -m "Add and update Honeypot Setup documentation"
    git push origin main    git add .
    git commit -m "Add and update Honeypot Setup documentation"
    git push origin main