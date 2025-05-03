# Honeypot Setup on Azure

## Overview

This project provides a step-by-step guide to deploying a honeypot on Azure using an ARM template and integrating it with Microsoft Sentinel for advanced threat monitoring and analysis. A honeypot is a security mechanism designed to attract and analyze malicious activity, helping to improve your organization's security posture.

> **Warning:** Honeypots are intentionally designed to attract malicious activity. Improper use or misconfiguration can expose your environment to unnecessary risks. Ensure you deploy this in a controlled and isolated environment, and never use production credentials or resources.

---

## Project Structure

- **`arm-template/`**: Contains the ARM template to deploy a honeypot VM on Azure.
- **`sentinel-integration/`**: Includes KQL queries and instructions for integrating the honeypot with Microsoft Sentinel.
- **`scripts/`**: Bash scripts for setting up and configuring the honeypot software.
- **`docs/`**: Additional documentation and references for the project.

---

## Prerequisites

Before starting, ensure you have the following:

1. **Azure Subscription**: An active Azure account with sufficient permissions to deploy resources.
2. **Azure CLI**: Installed and configured on your local machine. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Resource Group**: An Azure resource group where the honeypot will be deployed.
4. **SSH Key Pair**: A valid SSH key pair for accessing the VM.

---

## Setup Instructions

### 1. Deploy the Honeypot VM

Run the following command to deploy the honeypot VM using the provided ARM template:

```bash
az deployment group create \
  --name honeypotDeployment \
  --resource-group <your-resource-group> \
  --template-file ./arm-template/template.json
```

- Replace `<your-resource-group>` with the name of your Azure resource group.
- The deployment will create a virtual machine pre-configured for honeypot operations.

### 2. Install Honeypot Software

Once the VM is deployed, SSH into the VM and run the setup script to install and configure the honeypot software:

```bash
ssh azureuser@<vm-ip-address>
sudo bash ./scripts/install-honeypot.sh
```

- Replace `<vm-ip-address>` with the public IP address of the deployed VM.
- The script will install and configure the Cowrie honeypot software.

### 3. Integrate with Microsoft Sentinel

To monitor and analyze activity captured by the honeypot, integrate it with Microsoft Sentinel:

1. Open Microsoft Sentinel in the Azure portal.
2. Use the KQL queries provided in `sentinel-integration/kql-queries.txt` to create analytics rules:
   - Navigate to **Analytics** in Sentinel.
   - Create a new rule and paste the KQL query.
3. Set up alerts to notify you of suspicious activity.

---

## Important Notes

- **Isolate the Honeypot**: Always deploy the honeypot in a separate, isolated network to prevent attackers from pivoting to other resources.
- **Monitor Regularly**: Continuously monitor the honeypot's activity and logs to identify potential threats.
- **Do Not Use Production Credentials**: Never use real or sensitive credentials in the honeypot environment.

---

## Resources

- [Microsoft Sentinel Documentation](https://learn.microsoft.com/en-us/azure/sentinel/)
- [Azure ARM Templates Overview](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview)
- [Cowrie Honeypot](https://github.com/cowrie/cowrie)

---

## Disclaimer

This project is intended for educational and research purposes only. The author is not responsible for any misuse or damage caused by deploying this honeypot. Use it responsibly and in compliance with applicable laws and regulations.