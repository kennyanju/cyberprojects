# Web Application Firewall (WAF) Demo

## Overview

This project demonstrates how a basic web application can be protected using a Web Application Firewall (WAF). It simulates common attack payloads and explains WAF rules.

## Project Structure

- `webapp/`: A basic Python Flask web app.
- `scripts/`: Curl-based attack simulation scripts.
- `docs/`: Notes and Azure WAF integration.

## Setup Instructions

### 1. Run the Web App

```bash
pip install flask
python3 webapp/app.py
```

### 2. Simulate Attacks

```bash
bash scripts/test_attacks.sh
```

### 3. Azure Deployment (Conceptual)

Azure WAF can be deployed in front of an Azure App Service or Azure Front Door. This demo assumes local testing with a hypothetical Azure WAF filtering similar payloads.

## Azure Relevance

Azure WAF blocks OWASP Top 10 threats. This project simulates how WAF inspects and responds to malicious traffic.

## Disclaimer

Do not expose vulnerable apps to the internet without WAF and proper hardening.
