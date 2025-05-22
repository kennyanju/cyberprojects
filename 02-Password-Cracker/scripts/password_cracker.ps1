<#
.SYNOPSIS
    Simple SHA-256 password cracker using a wordlist.
.DESCRIPTION
    Attempts to find the plaintext password for a given SHA-256 hash by comparing it to hashes of passwords in a wordlist.
.EXAMPLE
    pwsh ./password_cracker.ps1 -Hash "<sha256_hash>" -Wordlist "./common-passwords.txt"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Hash,

    [Parameter(Mandatory=$true)]
    [string]$Wordlist
)

function Crack-Password {
    param(
        [string]$TargetHash,
        [string]$WordlistPath
    )
    if (-not (Test-Path $WordlistPath)) {
        Write-Error "Wordlist file '$WordlistPath' not found."
        return $null
    }

    try {
        foreach ($password in Get-Content $WordlistPath) {
            $password = $password.Trim()
            $hashedPassword = [BitConverter]::ToString([System.Security.Cryptography.SHA256]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($password))).Replace("-", "").ToLower()
            if ($hashedPassword -eq $TargetHash.ToLower()) {
                return $password
            }
        }
    } catch {
        Write-Error "An error occurred: $_"
    }
    return $null
}

Write-Host "Starting password cracking..."

$cracked = Crack-Password -TargetHash $Hash -WordlistPath $Wordlist

if ($cracked) {
    Write-Host "Password found: $cracked"
} else {
    Write-Host "Password not found."
}