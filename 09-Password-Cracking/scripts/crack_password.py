import hashlib

with open("hash.txt", "r") as f:
    target_hash = f.read().strip()

with open("wordlists/wordlist.txt", "r") as f:
    for line in f:
        word = line.strip()
        hash_object = hashlib.sha256(word.encode())
        if hash_object.hexdigest() == target_hash:
            print(f"Password found: {word}")
            break
    else:
        print("Password not found.")
