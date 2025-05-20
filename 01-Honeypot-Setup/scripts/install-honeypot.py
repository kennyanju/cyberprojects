import subprocess
import os
import sys

def log(message):
    print(f"[INFO] {message}")

def run_cmd(cmd, check=True):
    log(f"Running: {cmd}")
    result = subprocess.run(cmd, shell=True, check=check, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if result.stdout:
        print(result.stdout.strip())
    if result.stderr:
        print(result.stderr.strip())
    return result

def main():
    # Check for root privileges
    if os.geteuid() != 0:
        print("[ERROR] This script must be run as root (sudo).")
        sys.exit(1)

    # Update package list
    log("Updating package list...")
    run_cmd("apt update")

    # Install required packages
    log("Installing required packages...")
    run_cmd("apt install -y git python3-pip")

    # Clone Cowrie repository if it doesn't already exist
    cowrie_dir = "/opt/cowrie"
    if not os.path.isdir(cowrie_dir):
        log("Cloning Cowrie repository...")
        run_cmd(f"git clone https://github.com/cowrie/cowrie.git {cowrie_dir}")
    else:
        log("Cowrie repository already exists. Skipping clone.")

    # Navigate to Cowrie directory
    os.chdir(cowrie_dir)

    # Install Python dependencies
    log("Installing Python dependencies...")
    run_cmd("pip3 install --upgrade pip")
    run_cmd("pip3 install -r requirements.txt")

    # Copy configuration file if it doesn't already exist
    cfg_path = os.path.join("etc", "cowrie.cfg")
    if not os.path.isfile(cfg_path):
        log("Copying default configuration file...")
        run_cmd("cp etc/cowrie.cfg.dist etc/cowrie.cfg")
    else:
        log("Configuration file already exists. Skipping copy.")

    # Start Cowrie
    log("Starting Cowrie...")
    run_cmd("bin/cowrie start")

    log("Cowrie installation and setup complete.")

if __name__ == "__main__":
    main()