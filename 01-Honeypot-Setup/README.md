# Honeypot Setup on Azure

## Overview

This project provides a comprehensive guide and automation resources for deploying a Cowrie honeypot on Azure. It includes ARM and Bicep templates for VM deployment, scripts for automated honeypot installation (Bash, Python, PowerShell), and integration examples for Microsoft Sentinel. The goal is to help you safely attract, observe, and analyze malicious activity for educational and research purposes.

> **Warning:** Honeypots are intentionally designed to attract malicious activity. Improper use or misconfiguration can expose your environment to unnecessary risks. Always deploy in a controlled, isolated environment and never use production credentials or resources.

---

## Project Structure

- **`arm-template/`**
  - `template.json`: ARM template for deploying a honeypot VM on Azure.
  - `template.bicep`: Bicep version of the ARM template for modern Azure deployments.
- **`sentinel-integration/`**
  - `kql-queries.txt`: Example KQL queries for integrating honeypot logs with Microsoft Sentinel.
- **`scripts/`**
  - `install-honeypot.sh`: Bash script for automated Cowrie installation and setup.
  - `install-honeypot.py`: Python script for automated Cowrie installation and setup.
  - `install-honeypot.ps1`: PowerShell 7 script for automated Cowrie installation and setup.
- **`docs/`**
  - `doc.md`: Detailed documentation on folder structure, usage, and best practices.

---

## Prerequisites

- **Azure Subscription:** Active account with permissions to deploy resources.
- **Azure CLI:** Installed and configured. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- **Resource Group:** An Azure resource group for deployment.
- **SSH Key Pair:** For secure VM access.
- **(Optional) PowerShell 7:** For running the PowerShell script on Linux.

---

## Setup Instructions

### 1. Deploy the Honeypot VM

Choose your preferred template format:

**ARM Template:**
```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file ./arm-template/template.json
```

**Bicep Template:**
```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file ./arm-template/template.bicep
```

- Replace `<your-resource-group>` with your Azure resource group name.

---

### 2. Install Cowrie Honeypot

SSH into your deployed VM and run one of the following scripts with root privileges:

**Bash:**
```bash
sudo bash ./scripts/install-honeypot.sh
```

**Python:**
```bash
sudo python3 ./scripts/install-honeypot.py
```

**PowerShell 7:**
```bash
sudo pwsh ./scripts/install-honeypot.ps1
```

These scripts will:
- Install dependencies (`git`, `python3-pip`)
- Clone the Cowrie repository
- Install Python requirements
- Set up configuration
- Start the Cowrie honeypot service

---

### 3. Integrate with Microsoft Sentinel

- Use the KQL queries in `sentinel-integration/kql-queries.txt` to create analytics rules or hunting queries in Microsoft Sentinel.
- Set up alerts to notify you of suspicious honeypot activity.

---

## Important Notes

- **Isolate the Honeypot:** Deploy in a dedicated, isolated network or resource group.
- **Monitor Regularly:** Continuously review honeypot logs and activity.
- **Never Use Production Credentials:** Only use test accounts and passwords.
- **Review and Update:** Regularly update scripts and templates for security and compatibility.

---

## Resources

- [Cowrie Honeypot Documentation](https://github.com/cowrie/cowrie)
- [Microsoft Sentinel Documentation](https://learn.microsoft.com/en-us/azure/sentinel/)
- [Azure ARM Templates Overview](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

---

## Disclaimer

This project is intended for educational and research purposes only. The authors are not responsible for any misuse or damage caused by deploying this honeypot. Use responsibly and in compliance with all applicable laws and regulations.