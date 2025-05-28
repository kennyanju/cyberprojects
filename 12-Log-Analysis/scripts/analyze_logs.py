with open("logs/auth.log", "r") as log_file:
    for line in log_file:
        if "Failed password" in line:
            print(f"Suspicious activity: {line.strip()}")
