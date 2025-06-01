# Cloud Threat Intelligence Integration

## Overview

This project simulates how threat intelligence feeds can be integrated into security systems like Microsoft Sentinel to detect and respond to malicious indicators.

## Project Structure

- `threatfeeds/`: Sample threat feed with IPs and domains.
- `scripts/`: Parsing and matching scripts.
- `docs/`: Notes and integration examples.

## Setup Instructions

### 1. Simulate Threat Feed Matching

```bash
python3 scripts/check_threats.py
```

## Azure Relevance

Azure Sentinel can ingest threat intelligence feeds via APIs or file uploads and match them against log data. This lab simulates that process with basic Python.

## Disclaimer

Sample data is fictional and for learning only.
