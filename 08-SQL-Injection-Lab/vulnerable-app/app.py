from flask import Flask, request, render_template_string
import sqlite3
import os

app = Flask(__name__)

DB_FILE = 'users.db'

# Initialize the database only if it doesn't exist
def init_db():
    first_time = not os.path.exists(DB_FILE)
    conn = sqlite3.connect(DB_FILE)
    if first_time:
        conn.execute("CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)")
        conn.execute("INSERT INTO users (username, password) VALUES ('admin', 'adminpass')")
        conn.commit()
    return conn

conn = init_db()

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

@app.route('/', methods=['GET'])
def index():
    return render_template_string(HTML, message='', success=False)

@app.route('/login', methods=['GET', 'POST'])
def login():
    message = ''
    success = False
    if request.method == 'POST':
        username = request.form.get('username', '')
        password = request.form.get('password', '')
        # Log the attempted credentials for demonstration
        app.logger.info(f"Login attempt: username='{username}', password='{password}'")
        # Intentionally vulnerable query (for lab purposes)
        query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
        try:
            cursor = conn.execute(query)
            if cursor.fetchone():
                message = 'Logged in successfully!'
                success = True
            else:
                message = 'Login failed.'
        except Exception as e:
            message = f"Error: {e}"
    return render_template_string(HTML, message=message, success=success)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')