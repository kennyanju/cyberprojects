import requests

print("Simulating SQL injection...")
response = requests.get("http://localhost:5000/search", params={"q": "' OR '1'='1"})
print(response.text)