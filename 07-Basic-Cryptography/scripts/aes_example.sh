#!/bin/bash

# Simple AES encryption/decryption example using OpenSSL
# Usage: bash aes_example.sh

KEY_FILE="aes.key"
PLAINTEXT="Top secret message"
ENCRYPTED_FILE="encrypted.bin"
DECRYPTED_FILE="decrypted.txt"

# Generate a random key if not present
if [ ! -f "$KEY_FILE" ]; then
    echo "[INFO] Generating new AES key..."
    openssl rand -base64 32 > "$KEY_FILE"
fi

KEY=$(cat "$KEY_FILE")

# Encrypt the message
echo "$PLAINTEXT" | openssl enc -aes-256-cbc -base64 -pass pass:"$KEY" -pbkdf2 -out "$ENCRYPTED_FILE"
echo "[INFO] Encrypted message saved to $ENCRYPTED_FILE"

# Decrypt the message
openssl enc -d -aes-256-cbc -base64 -pass pass:"$KEY" -pbkdf2 -in "$ENCRYPTED_FILE" -out "$DECRYPTED_FILE"
DECRYPTED=$(cat "$DECRYPTED_FILE")
echo "[INFO] Decrypted message: $DECRYPTED"