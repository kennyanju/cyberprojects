# SQL Injection Lab

## Overview

This project simulates a vulnerable web application to demonstrate SQL injection attacks, their detection, and mitigation strategies. It features intentionally insecure login forms implemented in Python (Flask), PowerShell (Pode), and Bash (with Python/Flask), making it ideal for hands-on learning and security testing in a safe environment.

---

## Project Structure

- **`vulnerable-app/`**: Contains intentionally vulnerable web applications:
  - `app.py`: Python Flask vulnerable login form.
  - `app.ps1`: PowerShell (Pode) vulnerable login form.
  - `app.sh`: Bash wrapper to launch a vulnerable Flask app.
- **`scripts/`**: Example attack payloads and automation scripts for testing:
  - `sql_injection_payload.py`: Python script to automate SQL injection attacks.
  - `sql_injection_payload.ps1`: PowerShell script for SQL injection testing.
  - `sql_injection_payload.sh`: Bash script for SQL injection testing.
- **`docs/`**: Educational content on SQL injection, detection techniques, defense strategies, and lab notes.

---

## Setup Instructions

### 1. Install Dependencies

**For Python/Flask app:**
```bash
pip install flask
```

**For PowerShell app:**
```powershell
Install-Module -Name Pode -Scope CurrentUser
sudo apt install sqlite3   # Linux only, or use sqlite3.exe on Windows
```

**For Bash scripts:**
- Requires `curl` (default on most Linux/macOS).

---

### 2. Run the Vulnerable App

**Python (Flask):**
```bash
python3 vulnerable-app/app.py
```

**PowerShell (Pode):**
```powershell
pwsh vulnerable-app/app.ps1
```

**Bash (wrapper for Flask):**
```bash
bash vulnerable-app/app.sh
```

The app will be available at [http://localhost:5000](http://localhost:5000).

---

### 3. Try SQL Injection Attacks

You can test SQL injection using example payloads:

```bash
curl -X POST http://localhost:5000/login -d "username=admin' OR '1'='1&password=any"
```

Or use the provided scripts in the `scripts/` folder for automated testing:

- **Python:** `python3 scripts/sql_injection_payload.py`
- **PowerShell:** `pwsh scripts/sql_injection_payload.ps1`
- **Bash:** `bash scripts/sql_injection_payload.sh`

---

## Learning Objectives

- Understand how SQL injection vulnerabilities arise in web applications.
- Learn to craft and execute SQL injection payloads.
- Observe the impact of SQL injection on authentication and data retrieval.
- Explore detection and mitigation techniques, such as parameterized queries and input validation.

---

## Azure Relevance

- **Security Testing:** Practice identifying and exploiting SQL injection in a controlled lab before testing real-world or cloud-hosted apps.
- **Azure WAF & Defender:** Learn how Azure Web Application Firewall (WAF) and Defender for App Service can detect and block SQL injection attacks in production environments.
- **Logging & Monitoring:** Integrate with Azure Monitor or Sentinel to observe attack patterns and alerts.

---

## Best Practices & Disclaimer

- **Isolate Your Lab:** Run this project only in a safe, isolated environment. Never expose the vulnerable app to the public internet.
- **Educational Use Only:** This project is for learning and authorized testing. Do not use these techniques on systems you do not own or have explicit permission to test.
- **Mitigation:** After experimenting, review the `docs/` folder for secure coding practices and how to fix SQL injection vulnerabilities.

---

## Resources

- [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Pode Documentation](https://pode.readthedocs.io/)
- [Azure Web Application Firewall](https://learn.microsoft.com/en-us/azure/web-application-firewall/)
- [Microsoft Defender for App Service](https://learn.microsoft.com/en-us/azure/app-service/overview-security)

---