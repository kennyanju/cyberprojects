# Basic Cryptography

## Overview

This project provides clear, hands-on examples of encryption, decryption, and hashing in Python. It demonstrates how to use symmetric encryption (AES via Fernet) and secure hashing (SHA-256) for protecting and verifying data. The goal is to help you understand core cryptographic concepts and their practical application.

---

## Project Structure

- **`scripts/`**: Python scripts for encryption, decryption, and hashing.
  - `aes_example.py`: Demonstrates AES (Fernet) key generation, encryption, and decryption.
  - `sha256_hash.py`: Shows how to hash data using SHA-256.
- **`docs/`**: Notes and learning resources on cryptography best practices.

---

## Setup Instructions

### 1. Install Dependencies

```bash
pip install cryptography
```

---

### 2. Run the AES Encryption Example

```bash
python3 scripts/aes_example.py
```
- Generates a key (if not present), encrypts a message, and then decrypts it.

---

### 3. Run the SHA-256 Hashing Example

```bash
python3 scripts/sha256_hash.py
```
- Hashes a sample message and prints the original and hashed values.

---

## Key Concepts

- **AES Encryption (Fernet):** Symmetric encryption where the same key is used for both encryption and decryption. Suitable for securing data at rest or in transit.
- **SHA-256 Hashing:** One-way cryptographic hashing for verifying data integrity and securely storing passwords.
- **Key Management:** In production, always use secure key storage (e.g., Azure Key Vault, AWS KMS) and never hard-code secrets.

---

## Azure Relevance

Encryption and hashing are fundamental to data protection in the cloud. Azure services like Key Vault and Disk Encryption use similar cryptographic techniques. These scripts help you understand the basics before integrating with Azure or other cloud platforms.

---

## Best Practices

- Never hard-code keys or secrets in your source code.
- Regularly rotate encryption keys.
- Use strong, randomly generated keys.
- Always use secure key management solutions in production environments.

---

## Disclaimer

This code is for educational purposes only and is not production-ready. Always follow security best practices and compliance requirements in real-world applications.

---