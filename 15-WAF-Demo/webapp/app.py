from flask import Flask, request
app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Welcome to the Demo App</h1>"

@app.route('/search')
def search():
    query = request.args.get('q', '')
    return f"<p>Search results for: {query}</p>"

if __name__ == "__main__":
    app.run(debug=True)
