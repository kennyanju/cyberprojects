#!/bin/bash

# Script to recover deleted files from a disk image using foremost

IMAGE_PATH="sample-data/sample.img"
OUTPUT_DIR="recovery_output"

# Function to display usage
usage() {
    echo "Usage: $0 [image_path] [output_dir]"
    echo "Defaults: image_path=$IMAGE_PATH, output_dir=$OUTPUT_DIR"
}

# Allow optional arguments for image path and output directory
if [ "$1" ]; then
    IMAGE_PATH="$1"
fi
if [ "$2" ]; then
    OUTPUT_DIR="$2"
fi

# Check if foremost is installed
if ! command -v foremost &> /dev/null; then
    echo "[ERROR] foremost is not installed. Please install it and try again."
    exit 1
fi

# Check if image file exists
if [ ! -f "$IMAGE_PATH" ]; then
    echo "[ERROR] Disk image '$IMAGE_PATH' not found."
    usage
    exit 1
fi

echo "[*] Recovering deleted files from '$IMAGE_PATH'..."
mkdir -p "$OUTPUT_DIR"
foremost -i "$IMAGE_PATH" -o "$OUTPUT_DIR"

echo "[+] Recovery complete. Check the '$OUTPUT_DIR' directory for results."