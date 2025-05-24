# Keylogger (For Educational & Authorized Lab Use Only)

## Overview

This project provides simple keylogger scripts implemented in Python, PowerShell, and Bash. The tools capture keystrokes and log them to a file for analysis. They are intended strictly for educational, research, and authorized security testing purposes—**never for unauthorized or malicious use**.

> **Warning:** Unauthorized use of keyloggers is illegal and unethical. Only use these tools in controlled environments with explicit written permission.

---

## Project Structure

- **`scripts/`**: Contains keylogger scripts for multiple platforms:
  - `keylogger.py`: Python keylogger using `pynput`.
  - `keylogger.ps1`: PowerShell keylogger for Windows (PowerShell 7+).
  - `keylogger.sh`: Bash keylogger for Linux (requires `logkeys` or `showkey`).
- **`docs/`**: Notes, usage guidance, and references.

---

## Prerequisites

- **Python 3.x**: [Download Python](https://www.python.org/downloads/)
- **pynput library**: For the Python script (`pip install pynput`)
- **PowerShell 7**: For the PowerShell script on Windows
- **logkeys** or **showkey**: For the Bash script on Linux (`sudo apt install logkeys` or `sudo apt install kbd`)

---

## Setup Instructions

### 1. Install Dependencies

**Python:**
```bash
pip install pynput
```

**Bash (Linux):**
```bash
sudo apt install logkeys   # or: sudo apt install kbd
```

**PowerShell:**
- Ensure you are running PowerShell 7+ on Windows.

---

### 2. Run the Keylogger

**Python:**
```bash
python3 scripts/keylogger.py
```

**PowerShell:**
```powershell
pwsh scripts/keylogger.ps1
```

**Bash:**
```bash
sudo bash scripts/keylogger.sh
```

- All keystrokes will be logged to `keylog.txt` in the current directory.
- Stop the script with `Ctrl+C` or by closing the PowerShell window.

---

## Example Use Cases

- **Security Labs:** Demonstrate the risks of endpoint compromise and the importance of endpoint security controls.
- **Red Team Exercises:** Simulate attacker techniques in a safe, isolated environment.
- **Research:** Study keystroke logging and detection methods across platforms.

---

## Azure Relevance

- Deploy in Azure virtual machines or desktops for lab simulations.
- Forward `keylog.txt` to Azure Log Analytics or Microsoft Sentinel for monitoring and detection exercises.

---

## Best Practices & Legal Notice

- **Controlled Environments Only:** Never run these tools on production systems or without explicit authorization.
- **Ethical Use:** Use only for learning, research, or authorized security testing.
- **Compliance:** Ensure you comply with all applicable laws and organizational policies.
- **Cross-Platform:** Use the appropriate script for your OS and ensure required dependencies are installed.

> The authors are not responsible for any misuse or damage caused by these tools. Use responsibly and ethically.

---