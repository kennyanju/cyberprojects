Write-Host "Simulating SQL injection..."
$response = Invoke-WebRequest -Uri "http://localhost:5000/search?q=' OR '1'='1'" -UseBasicParsing
Write-Host $response.Content