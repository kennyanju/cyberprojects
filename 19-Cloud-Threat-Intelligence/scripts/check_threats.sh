#!/bin/bash

# filepath: /Users/sadiqadeyanju/cyberprojects/19-Cloud-Threat-Intelligence/scripts/check_threats.sh

THREAT_FEED="threatfeeds/sample_feed.txt"
LOG_DATA=("login from 192.168.1.100" "download from example.com" "access to badguy.net")

echo "Checking for matches in log data..."
while IFS= read -r threat; do
    threat=$(echo "$threat" | xargs) # Trim whitespace
    for log in "${LOG_DATA[@]}"; do
        if [[ "$log" == *"$threat"* ]]; then
            echo "Threat matched: $threat in log '$log'"
        fi
    done
done < "$THREAT_FEED"