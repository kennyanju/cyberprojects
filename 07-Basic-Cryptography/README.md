# Basic Cryptography

## Overview

This project provides clear, hands-on examples of encryption, decryption, and hashing in Python, PowerShell, and Bash. It demonstrates how to use symmetric encryption (AES via Fernet/OpenSSL/.NET) and secure hashing (SHA-256) for protecting and verifying data. The goal is to help you understand core cryptographic concepts and their practical application across platforms.

---

## Project Structure

- **`scripts/`**: Scripts for encryption, decryption, and hashing in multiple languages.
  - `aes_example.py`: Demonstrates AES (Fernet) key generation, encryption, and decryption in Python.
  - `aes_example.ps1`: AES encryption/decryption example in PowerShell 7+.
  - `aes_example.sh`: AES encryption/decryption example in Bash using OpenSSL.
  - `sha256_hash.py`: Shows how to hash data using SHA-256 in Python.
  - `sha256_hash.ps1`: SHA-256 hashing in PowerShell 7+.
  - `sha256_hash.sh`: SHA-256 hashing in Bash using sha256sum or OpenSSL.
- **`docs/`**: Notes and learning resources on cryptography best practices.

---

## Setup Instructions

### 1. Install Dependencies

**Python:**
```bash
pip install cryptography
```

**PowerShell (for .ps1 scripts):**
- PowerShell 7+ is required.

**Bash (for .sh scripts):**
- OpenSSL and/or sha256sum should be installed (default on most Linux/macOS).

---

### 2. Run the AES Encryption Example

**Python:**
```bash
python3 scripts/aes_example.py
```
**PowerShell:**
```powershell
pwsh scripts/aes_example.ps1
```
**Bash:**
```bash
bash scripts/aes_example.sh
```
- Generates a key (if not present), encrypts a message, and then decrypts it.

---

### 3. Run the SHA-256 Hashing Example

**Python:**
```bash
python3 scripts/sha256_hash.py
```
**PowerShell:**
```powershell
pwsh scripts/sha256_hash.ps1
```
**Bash:**
```bash
bash scripts/sha256_hash.sh
```
- Hashes a sample message and prints the original and hashed values.

---

## Key Concepts

- **AES Encryption:** Symmetric encryption where the same key is used for both encryption and decryption. Suitable for securing data at rest or in transit.
- **SHA-256 Hashing:** One-way cryptographic hashing for verifying data integrity and securely storing passwords.
- **Key Management:** In production, always use secure key storage (e.g., Azure Key Vault, AWS KMS, HashiCorp Vault) and never hard-code secrets.

---

## Azure Relevance

Encryption and hashing are fundamental to data protection in the cloud. Azure services like Key Vault and Disk Encryption use similar cryptographic techniques. These scripts help you understand the basics before integrating with Azure or other cloud platforms.

---

## Best Practices

- Never hard-code keys or secrets in your source code.
- Regularly rotate encryption keys.
- Use strong, randomly generated keys.
- Always use secure key management solutions in production environments.
- Use cross-platform scripts (Python, PowerShell, Bash) for flexibility in different environments.

---

## Disclaimer

This code is for educational purposes only and is not production-ready. Always follow security best practices and compliance requirements in real-world applications.

---