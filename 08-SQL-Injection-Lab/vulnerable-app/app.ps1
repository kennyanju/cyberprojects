<#
.SYNOPSIS
    Minimal intentionally vulnerable login form for SQL injection labs using PowerShell 7 and Pode.
.DESCRIPTION
    This script creates a web server with a login form and an intentionally vulnerable SQL query.
.NOTES
    Requires PowerShell 7+ and the Pode module.
    Install Pode: Install-Module -Name Pode -Scope CurrentUser
    Install SQLite: sudo apt install sqlite3 (Linux) or use a portable sqlite3.exe (Windows)
#>

Import-Module Pode

$DB_FILE = "users.db"

function Initialize-Database {
    if (-not (Test-Path $DB_FILE)) {
        & sqlite3 $DB_FILE "CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT);"
        & sqlite3 $DB_FILE "INSERT INTO users (username, password) VALUES ('admin', 'adminpass');"
    }
}

Initialize-Database

$html = @"
<!DOCTYPE html>
<html>
<head>
  <title>SQL Injection Lab - Login</title>
</head>
<body>
<h2>Login</h2>
<form method="POST">
  Username: <input name="username" autocomplete="off"><br>
  Password: <input name="password" type="password" autocomplete="off"><br>
  <input type="submit" value="Login">
</form>
<p style="color: {{color}}">{{message}}</p>
</body>
</html>
"@

Start-PodeServer -Port 5000 -ScriptBlock {
    Add-PodeRoute -Method Get -Path "/" -ScriptBlock {
        $res = $WebEvent.Response
        $res.ContentType = "text/html"
        $res.WriteLine(($html -replace "{{message}}", "" -replace "{{color}}", "red"))
    }

    Add-PodeRoute -Method Post -Path "/login" -ScriptBlock {
        $username = $WebEvent.Data.username
        $password = $WebEvent.Data.password

        # Intentionally vulnerable query (for lab purposes)
        $query = "SELECT * FROM users WHERE username='$username' AND password='$password'"
        Write-Host "Login attempt: username='$username', password='$password'"
        try {
            $result = & sqlite3 $DB_FILE $query
            if ($result) {
                $msg = "Logged in successfully!"
                $color = "green"
            } else {
                $msg = "Login failed."
                $color = "red"
            }
        } catch {
            $msg = "Error: $_"
            $color = "red"
        }
        $res = $WebEvent.Response
        $res.ContentType = "text/html"
        $res.WriteLine(($html -replace "{{message}}", $msg -replace "{{color}}", $color))
    }
}