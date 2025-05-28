#!/bin/bash
echo "Analyzing disk image..."
mkdir -p output
fls -r -m / images/sample.img > output/file_list.txt
echo "File listing complete. Check output/file_list.txt"
