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

    log("Updating package list...")
    run_cmd("apt update")

    log("Installing required packages...")
    run_cmd("apt install -y apache2 php php-mysqli git mariadb-server")

    dvwa_dir = "/var/www/html/dvwa"
    if not os.path.isdir(dvwa_dir):
        log("Cloning DVWA repository...")
        run_cmd(f"git clone https://github.com/digininja/DVWA.git {dvwa_dir}")
    else:
        log("DVWA already exists. Skipping clone.")

    os.chdir(dvwa_dir)

    config_path = "config/config.inc.php"
    if not os.path.isfile(config_path):
        log("Copying default config file...")
        run_cmd("cp config/config.inc.php.dist config/config.inc.php")
    else:
        log("Config file already exists. Skipping copy.")

    log("Setting permissions...")
    run_cmd(f"chown -R www-data:www-data {dvwa_dir}")

    log("Restarting Apache...")
    run_cmd("systemctl restart apache2")

    log("DVWA installation complete. Please configure your database and security settings as needed.")

if __name__ == "__main__":
    main()