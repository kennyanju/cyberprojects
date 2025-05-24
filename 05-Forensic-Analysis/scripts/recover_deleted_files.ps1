<#
.SYNOPSIS
    Recover deleted files from a disk image using foremost.
.DESCRIPTION
    This script runs foremost on a specified disk image and outputs recovered files to a directory.
.EXAMPLE
    pwsh ./recover_deleted_files.ps1 -ImagePath "sample-data/sample.img" -OutputDir "recovery_output"
#>

param(
    [string]$ImagePath = "sample-data/sample.img",
    [string]$OutputDir = "recovery_output"
)

function Show-Usage {
    Write-Host "Usage: pwsh ./recover_deleted_files.ps1 -ImagePath <image_path> -OutputDir <output_dir>"
    Write-Host "Defaults: image_path=sample-data/sample.img, output_dir=recovery_output"
}

# Check if foremost is installed
if (-not (Get-Command foremost -ErrorAction SilentlyContinue)) {
    Write-Error "foremost is not installed. Please install it and try again."
    exit 1
}

# Check if image file exists
if (-not (Test-Path $ImagePath)) {
    Write-Error "Disk image '$ImagePath' not found."
    Show-Usage
    exit 1
}

Write-Host "[*] Recovering deleted files from '$ImagePath'..."
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

try {
    & foremost -i $ImagePath -o $OutputDir
    Write-Host "[+] Recovery complete. Check the '$OutputDir' directory for results."
} catch {
    Write-Error "foremost failed: $_"
    exit 1
}