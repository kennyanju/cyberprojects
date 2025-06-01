# Cloud Threat Intelligence Integration

## Overview

This project demonstrates how threat intelligence (TI) feeds can be integrated into security systems like Microsoft Sentinel to detect and respond to malicious indicators. It includes multi-platform scripts and sample feeds to simulate matching log data against known Indicators of Compromise (IOCs) such as malicious domains, IPs, URLs, and hashes.

---

## Project Structure

- **`threatfeeds/`**: Sample threat feed with domains, IPs, URLs, and hashes.
- **`scripts/`**: Parsing and matching scripts in Python, PowerShell, and Bash.
- **`docs/`**: Notes and integration examples.

---

## Setup Instructions

### 1. Simulate Threat Feed Matching

**Python:**
```bash
python3 scripts/check_threats.py
```

**PowerShell:**
```powershell
pwsh scripts/check_threats.ps1
```

**Bash:**
```bash
bash scripts/check_threats.sh
```

Each script will check a sample log against the threat feed and print any matches.

---

## Azure Relevance

Azure Sentinel can ingest threat intelligence feeds via APIs, file uploads, or custom connectors and match them against log data for automated detection and response. This lab simulates that process using basic scripts and sample data.

---

## Best Practices

- Regularly update and validate your TI sources for accuracy and relevance.
- Use TI to enrich security alerts, automate triage, and block or investigate suspicious activity.
- Integrate with SIEM/SOAR platforms (like Sentinel) for automated response.

---

## Disclaimer

Sample data is fictional and for educational use only. Do not use these scripts or data in production environments without proper validation and authorization.

---