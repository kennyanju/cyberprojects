#!/bin/bash

# Simple SHA-256 hash example using OpenSSL or sha256sum

MESSAGE="${1:-Secure hashing example}"

if command -v sha256sum &> /dev/null; then
    HASH=$(echo -n "$MESSAGE" | sha256sum | awk '{print $1}')
elif command -v openssl &> /dev/null; then
    HASH=$(echo -n "$MESSAGE" | openssl dgst -sha256 | awk '{print $2}')
else
    echo "[ERROR] Neither sha256sum nor openssl is installed."
    exit 1
fi

echo "Original Message: $MESSAGE"
echo "SHA-256 Hash: $HASH"