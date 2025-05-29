<#
.SYNOPSIS
    Computes the SHA-256 hash of a given message.
.DESCRIPTION
    Demonstrates SHA-256 hashing in PowerShell 7+.
.EXAMPLE
    pwsh ./sha256_hash.ps1 -Message "Secure hashing example"
#>

param(
    [string]$Message = "Secure hashing example"
)

function Get-Sha256Hash {
    param([string]$InputString)
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($InputString)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hashBytes = $sha256.ComputeHash($bytes)
    return -join ($hashBytes | ForEach-Object { "{0:x2}" -f $_ })
}

$hashValue = Get-Sha256Hash -InputString $Message
Write-Host "Original Message: $Message"
Write-Host "SHA-256 Hash: $hashValue"