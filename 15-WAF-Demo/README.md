# Web Application Firewall (WAF) Demo

## Overview

This project demonstrates how a basic web application can be protected using a Web Application Firewall (WAF). It simulates common attack payloads and explains WAF rules. Multi-platform attack simulation scripts are provided for Bash, PowerShell, and Python to support hands-on testing.

---

## Project Structure

- `webapp/`: A basic Python Flask web app.
- `scripts/`: Attack simulation scripts in Bash, PowerShell, and Python.
  - `test_attacks.sh`: Bash script for simulating SQL injection.
  - `test_attacks.ps1`: PowerShell script for simulating SQL injection.
  - `test_attacks.py`: Python script for simulating SQL injection.
- `docs/`: Notes and Azure WAF integration.

---

## Setup Instructions

### 1. Run the Web App

```bash
pip install flask
python3 webapp/app.py
```

The app will be available at [http://localhost:5000](http://localhost:5000).

---

### 2. Simulate Attacks

**Bash:**
```bash
bash scripts/test_attacks.sh
```

**PowerShell:**
```powershell
pwsh scripts/test_attacks.ps1
```

**Python:**
```bash
python3 scripts/test_attacks.py
```

Each script sends a simulated SQL injection payload to the `/search` endpoint.

---

### 3. Azure Deployment (Conceptual)

Azure WAF can be deployed in front of an Azure App Service or Azure Front Door. This demo assumes local testing with a hypothetical Azure WAF filtering similar payloads.

---

## Azure Relevance

Azure WAF blocks OWASP Top 10 threats, including SQL injection and XSS. This project simulates how WAF inspects and responds to malicious traffic. Enable logging and alerting in Azure Sentinel to monitor and investigate traffic anomalies or blocked attacks.

---

## Best Practices

- Regularly review WAF logs and tune rules to balance security and usability.
- Never expose intentionally vulnerable apps to the public internet without WAF and proper hardening.
- Use multi-platform scripts to test WAF effectiveness from different environments.

---

## Disclaimer

Do not expose vulnerable apps to the internet without WAF and proper hardening. Use this project for educational and authorized testing only.

---