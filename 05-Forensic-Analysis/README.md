# Forensic Analysis

## Overview

This project demonstrates a basic digital forensic analysis workflow using open-source tools to investigate disk images and recover deleted files. It is designed for educational and lab use, simulating real-world forensic scenarios and techniques relevant to cybersecurity and incident response.

---

## Project Structure

- **`scripts/`**: Automation scripts for forensic analysis and recovery tasks:
  - `recover_deleted_files.sh`: Bash script for file recovery using `foremost`.
  - `recover_deleted_files.py`: Python script for file recovery using `foremost`.
  - `recover_deleted_files.ps1`: PowerShell script for file recovery using `foremost`.
- **`docs/`**: Notes, tool usage references, and best practices.
- **`sample-data/`**: Sample disk images or directories for forensic simulation and practice.

---

## Setup Instructions

### 1. Install Required Tools

Install the recommended forensic tools (for Linux):

```bash
sudo apt update
sudo apt install foremost testdisk sleuthkit
```

- **foremost**: File carving and recovery tool.
- **testdisk**: Partition recovery and disk analysis.
- **sleuthkit**: Suite including `fls`, `icat`, `tsk_recover`, etc.

> For Mac, use [Homebrew](https://brew.sh/) and run:  
> `brew install sleuthkit foremost testdisk`

---

### 2. Use Provided Scripts

You can recover deleted files from a sample disk image using any of the following scripts:

**Bash:**
```bash
bash scripts/recover_deleted_files.sh sample-data/sample.img recovery_output
```

**Python:**
```bash
python3 scripts/recover_deleted_files.py sample-data/sample.img recovery_output
```

**PowerShell 7:**
```bash
pwsh scripts/recover_deleted_files.ps1 -ImagePath sample-data/sample.img -OutputDir recovery_output
```

- By default, scripts use `sample-data/sample.img` and output to `recovery_output/`.
- You can specify a different image or output directory as arguments.

---

### 3. Explore and Analyze Sample Data

- Use the sample disk image in `sample-data/` to practice:
  - Listing files and directories:  
    `fls -r -m / sample-data/sample.img`
  - Extracting files by inode:  
    `icat sample-data/sample.img <inode>`
  - Recovering deleted files:  
    `tsk_recover sample-data/sample.img output_dir/`
  - Carving files by signature:  
    `foremost -i sample-data/sample.img -o output_dir/`

Refer to the `docs/notes.txt` for more commands, best practices, and tool explanations.

---

## Azure Relevance

- **Cloud Forensics:** In Azure, you can export VM disk snapshots for forensic analysis using these tools.
- **Incident Response:** Analyze compromised VM images offline, recover evidence, and correlate findings in Microsoft Sentinel or Log Analytics.
- **Automation:** Integrate these workflows into automated incident response pipelines for faster investigation.

---

## Best Practices & Disclaimer

- **Chain of Custody:** Always work on copies of disk images, never the original.
- **Documentation:** Record every action and command for reproducibility and legal integrity.
- **Legal/Ethical Use:** All provided data is simulated and for educational use only. Use these tools only in environments where you have explicit authorization.

---