import hashlib

def sha256_hash(message: str) -> str:
    """Return the SHA-256 hash of the given message as a hex string."""
    hash_object = hashlib.sha256(message.encode())
    return hash_object.hexdigest()

if __name__ == "__main__":
    message = "Secure hashing example"
    hash_value = sha256_hash(message)
    print(f"Original Message: {message}")
    print(f"SHA-256 Hash: {hash_value}")