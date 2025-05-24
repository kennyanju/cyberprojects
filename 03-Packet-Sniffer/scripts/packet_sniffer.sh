#!/bin/bash

# Simple Packet Sniffer using tcpdump
# Usage: sudo bash packet_sniffer.sh [interface] [count]
# Example: sudo bash packet_sniffer.sh eth0 20

INTERFACE=${1:-any}
COUNT=${2:-10}

echo "[*] Starting packet capture on interface: $INTERFACE (count: $COUNT)"
if ! command -v tcpdump &> /dev/null; then
    echo "[!] tcpdump is not installed. Please install it and try again."
    exit 1
fi

sudo tcpdump -i "$INTERFACE" -c "$COUNT" -nn -tt