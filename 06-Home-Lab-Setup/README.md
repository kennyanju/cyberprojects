# Home Lab Setup

## Overview

This project provides a comprehensive guide for building a personal cybersecurity home lab using either local virtualization or cloud infrastructure (such as Azure). It includes deployment templates, automation scripts, and planning resources to help you create, configure, and manage a safe environment for learning, testing, and practicing cybersecurity skills.

---

## Project Structure

- **`infrastructure/`**: ARM, Bicep, and Terraform templates for automated lab deployment (local or cloud).
- **`scripts/`**: Helper scripts to configure services (e.g., vulnerable apps, IDS, monitoring) in Bash, Python, and PowerShell.
- **`docs/`**: Planning guides, lab scenarios, best practices, and lab notes.

---

## Setup Options

### Option 1: Local Virtualization

Use tools like **VirtualBox** or **VMware Workstation** to create isolated virtual machines on your local computer.

**Recommended VM Roles:**
- **Kali Linux** (Attacker)
- **Windows 10** (Victim)
- **Ubuntu Server** (Logging/Monitoring)
- **Metasploitable** (Vulnerable Target)
- **Security Onion** (Network Monitoring)

**Tips:**
- Use host-only or internal networking for isolation.
- Take VM snapshots before major changes.

---

### Option 2: Azure Cloud Setup (Recommended)

Deploy your lab in Azure for scalability, remote access, and integration with cloud-native security tools.

**Example Deployment Command (ARM):**
```bash
az deployment group create \
  --name homelabDeployment \
  --resource-group <your-resource-group> \
  --template-file ./infrastructure/homelab_arm_template.json
```

**Example Deployment Command (Bicep):**
```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file ./infrastructure/homelab_arm_template.bicep
```
- Replace `<your-resource-group>` with your Azure resource group name.

**Benefits:**
- Dynamic scaling and easy teardown.
- Secure remote access via Azure Bastion or VPN.
- Integration with Azure Sentinel and Log Analytics.

---

## Lab Configuration

After deploying your infrastructure, use the provided scripts to install and configure key lab services:

- **DVWA** (Damn Vulnerable Web App)
- **Metasploitable** or other intentionally vulnerable VMs
- **OpenVAS** (Vulnerability Scanning)
- **Snort** or **Suricata** (IDS/IPS)
- **ELK Stack** (Centralized Logging)
- **Security Onion** (Network Security Monitoring)

**Example:**
```bash
bash scripts/install_dvwa.sh
python3 scripts/install_dvwa.py
pwsh scripts/install_dvwa.ps1
bash scripts/setup_snort.sh
```

---

## Lab Notes & Best Practices

- **Network Isolation:** Always isolate lab networks from production and personal networks.
- **Snapshots & Backups:** Take VM snapshots and regular backups before major experiments.
- **Resource Monitoring:** Use Azure Budgets and Cost Management to monitor cloud usage.
- **Access Control:** Restrict remote access using firewalls, NSGs, or VPNs.
- **Documentation:** Keep detailed notes of your lab topology and changes.
- **Automation:** Use scripts and templates (Bash, Python, PowerShell, Terraform, ARM, Bicep) for consistent deployments.
- **Multi-Platform Support:** Provided scripts support Bash, Python, and PowerShell for flexibility.
- **Cleanup:** Regularly review and delete unused resources to save costs and reduce attack surface.
- **Security Updates:** Keep all lab systems and software up to date.

---

## Azure Relevance

- **Scalability:** Easily add or remove lab components as needed.
- **Security:** Use NSGs, firewalls, and private networking for isolation.
- **Monitoring:** Integrate with Azure Sentinel for real-time analytics and incident response.
- **Cost Management:** Use resource tagging and policies to control spend.

---

## Disclaimer

This lab is intended for **ethical cybersecurity learning and research only**. Do not use these tools or techniques on systems or networks without explicit authorization. The authors are not responsible for misuse or any resulting damages.

---