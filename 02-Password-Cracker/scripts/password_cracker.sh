#!/bin/bash

# Simple SHA-256 password cracker using a wordlist

usage() {
    echo "Usage: $0 <sha256_hash> <wordlist_file>"
    exit 1
}

if [ $# -ne 2 ]; then
    usage
fi

TARGET_HASH="$1"
WORDLIST="$2"

if [ ! -f "$WORDLIST" ]; then
    echo "[ERROR] Wordlist file '$WORDLIST' not found."
    exit 1
fi

echo "[*] Starting password cracking..."

while IFS= read -r password; do
    password=$(echo -n "$password" | tr -d '\r\n')
    hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')
    if [[ "$hashed_password" == "$TARGET_HASH" ]]; then
        echo "Password found: $password"
        exit 0
    fi
done < "$WORDLIST"

echo "Password not found."
exit 1