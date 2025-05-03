# Honeypot Setup on Azure

## Overview

This project sets up a basic honeypot on Azure using an ARM template and integrates it with Microsoft Sentinel for threat monitoring.

## Project Structure

- `arm-template/`: ARM template to deploy a honeypot VM on Azure.
- `sentinel-integration/`: KQL queries and Sentinel setup instructions.
- `scripts/`: Setup and installation scripts for the honeypot.
- `docs/`: Documentation and references.

## Setup Instructions

### 1. Deploy Honeypot VM

```bash
az deployment group create \
  --name honeypotDeployment \
  --resource-group <your-resource-group> \
  --template-file ./arm-template/template.json
```

### 2. Install Honeypot Software

SSH into the VM and run the setup script:

```bash
ssh azureuser@<vm-ip-address>
sudo bash ./scripts/install-honeypot.sh
```

### 3. Integrate with Microsoft Sentinel

Use the KQL queries in `sentinel-integration/kql-queries.txt` to create analytics rules and alerts in Microsoft Sentinel.

## Resources

- [Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/)
- [Azure ARM Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview)
