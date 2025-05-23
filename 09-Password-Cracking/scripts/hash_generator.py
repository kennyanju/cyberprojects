import hashlib

password = "letmein"
hash_object = hashlib.sha256(password.encode())
hex_dig = hash_object.hexdigest()

with open("hash.txt", "w") as f:
    f.write(hex_dig)

print(f"Password: {password}")
print(f"SHA-256 Hash: {hex_dig}")
