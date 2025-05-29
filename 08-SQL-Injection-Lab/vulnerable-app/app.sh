#!/bin/bash

# Minimal intentionally vulnerable login form using Flask via flask CLI and sqlite3
# Requires: flask, sqlite3, and Python 3 installed

DB_FILE="users.db"
APP_FILE="vuln_flask_app.py"

# Create vulnerable Flask app if not present
cat > "$APP_FILE" << 'EOF'
from flask import Flask, request, render_template_string
import sqlite3
import os

app = Flask(__name__)
DB_FILE = 'users.db'

def init_db():
    if not os.path.exists(DB_FILE):
        conn = sqlite3.connect(DB_FILE)
        conn.execute("CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)")
        conn.execute("INSERT INTO users (username, password) VALUES ('admin', 'adminpass')")
        conn.commit()
        conn.close()
init_db()

HTML = '''
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
<p style="color: {{ 'green' if success else 'red' }}">{{ message }}</p>
</body>
</html>
'''

@app.route('/', methods=['GET', 'POST'])
def login():
    message = ''
    success = False
    if request.method == 'POST':
        username = request.form.get('username', '')
        password = request.form.get('password', '')
        # Intentionally vulnerable query
        query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
        try:
            conn = sqlite3.connect(DB_FILE)
            cursor = conn.execute(query)
            if cursor.fetchone():
                message = 'Logged in successfully!'
                success = True
            else:
                message = 'Login failed.'
            conn.close()
        except Exception as e:
            message = f"Error: {e}"
    return render_template_string(HTML, message=message, success=success)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
EOF

# Initialize the database if not present
if [ ! -f "$DB_FILE" ]; then
    echo "[*] Initializing SQLite database..."
    python3 "$APP_FILE" &
    sleep 2
    pkill -f "$APP_FILE"
fi

echo "[*] Starting vulnerable Flask app on http://localhost:5000 ..."
python3 "$APP_FILE"