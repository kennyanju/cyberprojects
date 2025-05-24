# Packet Sniffer

## Overview

This project implements a basic packet sniffer using Python's [`scapy`](https://scapy.readthedocs.io/en/latest/introduction.html) library, as well as Bash and PowerShell scripts leveraging `tcpdump`. The tools capture network packets in real time and log useful metadata for analysis. They are intended for educational, research, and controlled security testing purposes.

> **Warning:** Capturing network traffic without authorization is illegal and unethical. Only use these tools in environments where you have explicit permission.

---

## Project Structure

- **`scripts/`**: Contains packet sniffing scripts in multiple languages:
  - `packet_sniffer.py`: Python script using Scapy for packet capture.
  - `packet_sniffer.sh`: Bash script using `tcpdump` for packet capture.
  - `packet_sniffer.ps1`: PowerShell 7 script using `tcpdump` for packet capture.
- **`docs/`**: Additional documentation and usage references.

---

## Prerequisites

- **Python 3.x**: [Download Python](https://www.python.org/downloads/)
- **Scapy**: Python packet manipulation library (`pip install scapy`)
- **tcpdump**: Required for Bash and PowerShell scripts (`sudo apt install tcpdump`)
- **Root/Administrator Privileges**: Required to capture packets on most interfaces
- **PowerShell 7**: For running the `.ps1` script on Linux/macOS

---

## Setup Instructions

### 1. Install Dependencies

**For Python/Scapy:**
```bash
pip install scapy
```

**For Bash/PowerShell:**
```bash
sudo apt install tcpdump
```

---

### 2. Run the Packet Sniffer

**Python (Scapy):**
```bash
sudo python3 scripts/packet_sniffer.py --interface <network-interface> --count <packet-count>
```
- Replace `<network-interface>` with your network device (e.g., `eth0`, `en0`, or leave blank for default).
- Replace `<packet-count>` with the number of packets to capture (use `0` for infinite).

**Example:**
```bash
sudo python3 scripts/packet_sniffer.py --interface eth0 --count 50
```

**Bash (tcpdump):**
```bash
sudo bash scripts/packet_sniffer.sh eth0 50
```

**PowerShell 7 (tcpdump):**
```bash
sudo pwsh scripts/packet_sniffer.ps1 -Interface eth0 -Count 50
```

Captured packets will be displayed in the terminal with timestamps and summaries.

---

## Advanced Usage

- **Filter by Interface:** Use the interface argument/flag to specify which network interface to monitor.
- **Limit Packet Capture:** Use the count argument/flag to limit the number of packets (default is 10, `0` for unlimited).
- **Logging:** Redirect output to a file for later analysis:
  ```bash
  sudo python3 scripts/packet_sniffer.py --interface eth0 --count 100 > captured_packets.log
  sudo bash scripts/packet_sniffer.sh eth0 100 > captured_packets.log
  sudo pwsh scripts/packet_sniffer.ps1 -Interface eth0 -Count 100 > captured_packets.log
  ```

---

## Azure Relevance

- These scripts can be deployed to a Linux VM in Azure with port mirroring enabled to capture mirrored traffic for analysis.
- Captured logs can be ingested into **Azure Log Analytics** and monitored using **Microsoft Sentinel** for threat detection and investigation.

---

## Best Practices & Disclaimer

- **Legal/Ethical Use:** Only use these tools in lab environments or with explicit written permission.
- **Isolation:** Run in isolated or test networks to avoid accidental data capture.
- **Monitoring:** Regularly review captured data and delete sensitive information as appropriate.

> The authors are not responsible for any misuse or damage caused by these tools. Use responsibly and in compliance with all applicable laws and regulations.

---