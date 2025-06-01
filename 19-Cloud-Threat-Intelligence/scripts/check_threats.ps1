$threats = Get-Content "threatfeeds/sample_feed.txt" | ForEach-Object { $_.Trim() }

$logData = @(
    "login from 192.168.1.100"
    "download from example.com"
    "access to badguy.net"
)

Write-Host "Checking for matches in log data..."
foreach ($log in $logData) {
    foreach ($threat in $threats) {
        if ($log -like "*$threat*") {
            Write-Host "Threat matched: $threat in log '$log'"
        }
    }
}