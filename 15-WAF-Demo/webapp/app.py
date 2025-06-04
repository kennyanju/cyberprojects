from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Welcome to the Demo App</h1><p>Try the <a href='/search?q=test'>search</a> endpoint.</p>"

@app.route('/search')
def search():
    query = request.args.get('q', '')
    # Simulate a vulnerable search result (for WAF demo)
    html = """
    <h2>Search</h2>
    <form method="get">
      <input name="q" value="{{query}}" autocomplete="off">
      <input type="submit" value="Search">
    </form>
    <p>Search results for: {{query}}</p>
    """
    return render_template_string(html, query=query)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")