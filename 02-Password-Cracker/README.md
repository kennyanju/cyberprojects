# Password Cracker

## Overview

This project demonstrates a basic password-cracking tool that uses dictionary attacks to test the strength of passwords. It is designed for **educational purposes only** to highlight the risks of weak passwords and the importance of strong password practices.

> **Warning:** Unauthorized use of password-cracking tools is illegal and unethical. This tool should only be used in controlled environments with explicit permission.

---

## Project Structure

- **`scripts/`**: Contains password-cracking scripts in multiple languages:
  - `password_cracker.py`: Python script for SHA-256 dictionary-based password cracking.
  - `password_cracker.ps1`: PowerShell 7 script for SHA-256 password cracking.
  - `password_cracker.sh`: Bash script for SHA-256 password cracking.
- **`docs/`**: Documentation and sample wordlists for testing.
  - `common-passwords.txt`: Example wordlist for dictionary attacks.
  - `notes.txt`: Usage notes and best practices.

---

## Prerequisites

- **Python 3.x**: [Download Python](https://www.python.org/downloads/)
- **PowerShell 7** (for `.ps1` script): [Install PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell)
- **Bash** (for `.sh` script): Available on Linux/macOS and Windows (via WSL or Git Bash)
- **Wordlist**: A text file containing potential passwords (e.g., `docs/common-passwords.txt` or `rockyou.txt`)

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/cybersecurity-projects.git
cd 02-Password-Cracker
```

### 2. Run the Password Cracker

#### Python

```bash
python3 scripts/password_cracker.py --hash <hashed_password> --wordlist docs/common-passwords.txt
```

#### PowerShell 7

```bash
pwsh scripts/password_cracker.ps1 -Hash "<hashed_password>" -Wordlist "docs/common-passwords.txt"
```

#### Bash

```bash
bash scripts/password_cracker.sh <hashed_password> docs/common-passwords.txt
```

Replace `<hashed_password>` with the SHA-256 hash you want to crack.

---

## Customizing the Wordlist

You can replace `docs/common-passwords.txt` with any wordlist, such as [rockyou.txt](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt), for more comprehensive testing.

---

## Example Usage

```bash
python3 scripts/password_cracker.py --hash ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f --wordlist docs/common-passwords.txt
```

---

## Advanced Usage

### Containerization with Docker

1. Create a `Dockerfile`:

    ```dockerfile
    FROM python:3.9-slim
    WORKDIR /app
    COPY . .
    CMD ["python3", "scripts/password_cracker.py"]
    ```

2. Build and run the container:

    ```bash
    docker build -t password-cracker .
    docker run password-cracker --hash <hashed_password> --wordlist docs/common-passwords.txt
    ```

### Cloud Deployment

- **Azure Container Instances**: Run the containerized script in a managed environment.
- **Azure Virtual Machines**: Deploy the script on a VM for more flexibility.
- **Monitoring**: Forward logs to Microsoft Sentinel for analysis.

---

## Best Practices

- **Use Strong Passwords:** Avoid using passwords that are easily guessable or found in common wordlists.
- **Test in Isolated Environments:** Always run this tool in a controlled, isolated environment.
- **Obtain Permission:** Only use this tool on systems where you have explicit authorization.

---

## Disclaimer

This tool is intended **only** for ethical learning and testing purposes. Unauthorized use of this tool on systems without permission is illegal and unethical. The authors are not responsible for any misuse or damage caused by this tool. Use it responsibly and in compliance with applicable laws and regulations.

---

## Resources

- [Python Documentation](https://docs.python.org/3/)
- [RockYou Wordlist](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)
- [Docker Documentation](https://docs.docker.com/)
- [Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/)
- [Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/)