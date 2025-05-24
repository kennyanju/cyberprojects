<#
.SYNOPSIS
    Simple Packet Sniffer using tcpdump (requires tcpdump and sudo/root privileges).
.DESCRIPTION
    Captures a specified number of packets on a given network interface.
.EXAMPLE
    pwsh ./packet_sniffer.ps1 -Interface eth0 -Count 20
#>

param(
    [string]$Interface = "any",
    [int]$Count = 10
)

Write-Host "[*] Starting packet capture on interface: $Interface (count: $Count)"

if (-not (Get-Command tcpdump -ErrorAction SilentlyContinue)) {
    Write-Error "tcpdump is not installed. Please install it and try again."
    exit 1
}

# Run tcpdump (requires sudo/root)
sudo tcpdump -i $Interface -c $Count -nn -tt