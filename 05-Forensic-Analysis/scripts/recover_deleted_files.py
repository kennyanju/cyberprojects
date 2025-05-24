import subprocess
import sys
import os

def usage(default_image, default_output):
    print(f"Usage: python3 recover_deleted_files.py [image_path] [output_dir]")
    print(f"Defaults: image_path={default_image}, output_dir={default_output}")

def main():
    IMAGE_PATH = "sample-data/sample.img"
    OUTPUT_DIR = "recovery_output"

    # Allow optional arguments for image path and output directory
    if len(sys.argv) > 1:
        IMAGE_PATH = sys.argv[1]
    if len(sys.argv) > 2:
        OUTPUT_DIR = sys.argv[2]

    # Check if foremost is installed
    if not shutil.which("foremost"):
        print("[ERROR] foremost is not installed. Please install it and try again.")
        sys.exit(1)

    # Check if image file exists
    if not os.path.isfile(IMAGE_PATH):
        print(f"[ERROR] Disk image '{IMAGE_PATH}' not found.")
        usage("sample-data/sample.img", "recovery_output")
        sys.exit(1)

    print(f"[*] Recovering deleted files from '{IMAGE_PATH}'...")
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    try:
        subprocess.run(["foremost", "-i", IMAGE_PATH, "-o", OUTPUT_DIR], check=True)
        print(f"[+] Recovery complete. Check the '{OUTPUT_DIR}' directory for results.")
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] foremost failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    import shutil
    main()