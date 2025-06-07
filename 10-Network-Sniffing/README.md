# Network Sniffing Lab

## Overview

This project demonstrates basic network sniffing using Python (`scapy`), PowerShell (`tshark`), and Bash (`tcpdump` or `tshark`). It captures and displays network packets from the default interface, supporting multi-platform learning and automation.

---

## Project Structure

- `scripts/`: Packet sniffer scripts in Python, PowerShell, and Bash.
  - `sniffer.py`: Python packet sniffer using scapy.
  - `sniffer.ps1`: PowerShell sniffer using tshark (Wireshark CLI).
  - `sniffer.sh`: Bash sniffer using tcpdump or tshark.
- `docs/`: Notes and learning resources.

---

## Setup Instructions

### 1. Install Dependencies

**Python:**
```bash
pip install scapy
```

**PowerShell:**
- Requires PowerShell 7+ and `tshark` (Wireshark CLI) installed.

**Bash:**
- Requires `tcpdump` or `tshark` installed.

---

### 2. Run the Packet Sniffer

**Python:**
```bash
sudo python3 scripts/sniffer.py
```

**PowerShell:**
```powershell
sudo pwsh scripts/sniffer.ps1
```

**Bash:**
```bash
sudo bash scripts/sniffer.sh
```

---

## Azure Relevance

Monitoring network traffic is critical in cloud environments. Azure Network Watcher and Defender for Cloud provide packet-level insights and threat detection capabilities. Use these scripts for lab learning before working with Azure-native tools.

---

## Best Practices

- Always capture traffic with proper permissions and only in ethical, authorized contexts.
- Review and filter captured data to protect sensitive information and maintain privacy.
- Use packet sniffing for troubleshooting, security monitoring, and learning—not for unauthorized surveillance.

---

## Disclaimer

Use only on networks you are authorized to monitor. Unauthorized sniffing is illegal.

---