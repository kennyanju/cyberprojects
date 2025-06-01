with open("threatfeeds/sample_feed.txt", "r") as feed:
    threats = [line.strip() for line in feed]

log_data = ["login from 192.168.1.100", "download from example.com", "access to badguy.net"]

print("Checking for matches in log data...")
for log in log_data:
    for threat in threats:
        if threat in log:
            print(f"Threat matched: {threat} in log '{log}'")
