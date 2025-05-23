# SQL Injection Lab

## Overview

This project simulates a vulnerable web application to demonstrate SQL injection attacks, their detection, and mitigation strategies. It features a simple Python Flask app with an intentionally insecure login form, making it ideal for hands-on learning and security testing in a safe environment.

---

## Project Structure

- **`vulnerable-app/`**: Contains the vulnerable Flask web application.
- **`scripts/`**: Example attack payloads, curl commands, and automation scripts for testing.
- **`docs/`**: Educational content on SQL injection, detection techniques, and defense strategies.

---

## Setup Instructions

### 1. Install Dependencies

```bash
pip install flask
```

### 2. Run the Vulnerable App

```bash
python3 vulnerable-app/app.py
```

The app will be available at [http://localhost:5000](http://localhost:5000).

---

### 3. Try SQL Injection Attacks

You can test SQL injection using example payloads:

```bash
curl -X POST http://localhost:5000/login -d "username=admin' OR '1'='1&password=any"
```

Or use the provided scripts in the `scripts/` folder for automated testing.

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
- [Azure Web Application Firewall](https://learn.microsoft.com/en-us/azure/web-application-firewall/)
- [Microsoft Defender for App Service](https://learn.microsoft.com/en-us/azure/app-service/overview-security)

---