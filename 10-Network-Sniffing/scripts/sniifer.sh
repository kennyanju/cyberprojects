#!/bin/bash
# filepath: /Users/sadiqadeyanju/cyberprojects/10-Network-Sniffing/scripts/sniffer.sh

# Simple network packet sniffer using tcpdump or tshark

echo "Starting packet capture... Press Ctrl+C to stop."

if command -v tcpdump &> /dev/null; then
    sudo tcpdump -nn -l
elif command -v tshark &> /dev/null; then
    sudo tshark
else
    echo "[ERROR] Neither tcpdump nor tshark is installed. Please install one of them to use this script."
    exit 1
fi