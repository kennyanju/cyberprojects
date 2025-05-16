# Password Cracker

## Overview

This project demonstrates a basic password-cracking tool that uses dictionary attacks to test the strength of passwords. It is designed for **educational purposes only** to highlight the risks of weak passwords and the importance of strong password practices.

> **Warning:** Unauthorized use of password-cracking tools is illegal and unethical. This tool should only be used in controlled environments with explicit permission.

---

## Features

- Performs dictionary-based password cracking.
- Demonstrates the vulnerabilities of weak passwords.
- Allows customization of wordlists for testing.
- Can be containerized and deployed in cloud environments for controlled lab testing.

---

## Project Structure

- **`scripts/`**: Contains the Python script to perform dictionary-based password cracking.
- **`docs/`**: Includes documentation and sample wordlists for testing.

---

## Prerequisites

Before running the tool, ensure you have the following:

1. **Python 3.x**: Installed on your system. [Download Python](https://www.python.org/downloads/).
2. **Wordlist**: A text file containing potential passwords (e.g., `docs/common-passwords.txt` or `rockyou.txt`).
3. **Git**: Installed on your system to clone the repository. [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

---

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/cybersecurity-projects.git
cd 02-Password-Cracker
```

### 2. Install Dependencies

Ensure all required Python libraries are installed. If the script uses external libraries, you can install them using `pip`:

```bash
pip install -r requirements.txt
```

> If no `requirements.txt` exists, ensure Python's standard libraries are sufficient for the script.

### 3. Run the Password Cracker

Execute the password-cracking script:

```bash
python3 scripts/password_cracker.py
```

### 4. Customize the Wordlist

You can replace the default wordlist (`docs/common-passwords.txt`) with a more comprehensive one, such as `rockyou.txt`. Download it and update the script to point to the new file.

---

## Example Usage

Here’s an example of how the tool works:

1. The script takes a hashed password and a wordlist as input.
2. It iterates through the wordlist, hashing each word and comparing it to the target hash.
3. If a match is found, the password is revealed.

Sample command:

```bash
python3 scripts/password_cracker.py --hash <hashed_password> --wordlist docs/common-passwords.txt
```

---

## Advanced Usage

### Containerization with Docker

You can containerize the script for isolated testing:

1. Create a `Dockerfile`:

```dockerfile
# Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python3", "scripts/password_cracker.py"]
```

2. Build and run the container:

```bash
docker build -t password-cracker .
docker run password-cracker
```

### Deploying in Azure

For controlled lab testing, you can deploy the tool in Azure using services like:

- **Azure Container Instances**: Run the containerized script in a managed environment.
- **Azure Virtual Machines**: Deploy the script on a VM for more flexibility.

You can forward logs from the container or VM to **Microsoft Sentinel** for monitoring and analysis.

---

## Best Practices

- **Use Strong Passwords**: Avoid using passwords that are easily guessable or found in common wordlists.
- **Test in Isolated Environments**: Always run this tool in a controlled, isolated environment to prevent unintended consequences.
- **Obtain Permission**: Only use this tool on systems where you have explicit authorization.

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