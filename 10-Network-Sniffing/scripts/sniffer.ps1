<#
.SYNOPSIS
    Simple network packet sniffer using PowerShell 7 and Pcap.Net CLI.
.DESCRIPTION
    Captures and prints packet summaries from a selected network interface.
.NOTES
    Requires Pcap.Net CLI tools (https://pcapdotnet.github.io/) or tshark (Wireshark CLI).
    Example below uses tshark for cross-platform compatibility.
#>

Write-Host "Starting packet capture... Press Ctrl+C to stop."

# Use tshark if available
if (Get-Command tshark -ErrorAction SilentlyContinue) {
    tshark -i 1 -c 0
} else {
    Write-Error "tshark (Wireshark CLI) is not installed or not in PATH. Please install it to use this script."
}