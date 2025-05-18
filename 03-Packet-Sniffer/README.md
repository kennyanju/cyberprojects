# Packet Sniffer

## Overview

This project implements a basic packet sniffer using Python's [`scapy`](https://scapy.readthedocs.io/en/latest/introduction.html) library. The tool captures network packets in real time and logs useful metadata for analysis. It is intended for educational, research, and controlled security testing purposes.

> **Warning:** Capturing network traffic without authorization is illegal and unethical. Only use this tool in environments where you have explicit permission.

---

## Project Structure

- **`scripts/`**: Contains the Python script for packet sniffing.
- **`docs/`**: Additional documentation and usage references.

---

## Prerequisites

- **Python 3.x**: [Download Python](https://www.python.org/downloads/)
- **Scapy**: Python packet manipulation library
- **Root/Administrator Privileges**: Required to capture packets on most interfaces

---

## Setup Instructions

### 1. Install Dependencies

```bash
pip install scapy
```

### 2. Run the Packet Sniffer

```bash
sudo python3 scripts/packet_sniffer.py --interface <network-interface> --count <packet-count>
```

- Replace `<network-interface>` with your network device (e.g., `eth0`, `en0`, or leave blank for default).
- Replace `<packet-count>` with the number of packets to capture (use `0` for infinite).

**Example:**
```bash
sudo python3 scripts/packet_sniffer.py --interface eth0 --count 50
```

Captured packets will be displayed in the terminal with timestamps and summaries.

---

## Advanced Usage

- **Filter by Interface:** Use the `--interface` flag to specify which network interface to monitor.
- **Limit Packet Capture:** Use the `--count` flag to limit the number of packets (default is 10, `0` for unlimited).
- **Logging:** You can redirect output to a file for later analysis:
  ```bash
  sudo python3 scripts/packet_sniffer.py --interface eth0 --count 100 > captured_packets.log
  ```

---

## Azure Relevance

- This script can be deployed to a Linux VM in Azure with port mirroring enabled to capture mirrored traffic for analysis.
- Captured logs can be ingested into **Azure Log Analytics** and monitored using **Microsoft Sentinel** for threat detection and investigation.

---

## Best Practices & Disclaimer

- **Legal/Ethical Use:** Only use this tool in lab environments or with explicit written permission.
- **Isolation:** Run in isolated or test networks to avoid accidental data capture.
- **Monitoring:** Regularly review captured data and delete sensitive information as appropriate.

> The authors are not responsible for any misuse or damage caused by this tool. Use responsibly and in compliance with all applicable laws and regulations.

---