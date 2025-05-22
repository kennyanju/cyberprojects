from cryptography.fernet import Fernet

def generate_key(key_file="aes.key"):
    """Generate and save a key to a file."""
    key = Fernet.generate_key()
    with open(key_file, "wb") as f:
        f.write(key)
    return key

def load_key(key_file="aes.key"):
    """Load a key from a file."""
    with open(key_file, "rb") as f:
        return f.read()

def encrypt_message(message, cipher):
    """Encrypt a message using the provided cipher."""
    return cipher.encrypt(message.encode())

def decrypt_message(token, cipher):
    """Decrypt a token using the provided cipher."""
    return cipher.decrypt(token).decode()

if __name__ == "__main__":
    key_file = "aes.key"
    # Generate a key if it doesn't exist
    try:
        key = load_key(key_file)
    except FileNotFoundError:
        key = generate_key(key_file)

    cipher = Fernet(key)

    message = "Top secret message"
    encrypted = encrypt_message(message, cipher)
    print(f"Encrypted: {encrypted}")

    decrypted = decrypt_message(encrypted, cipher)
    print(f"Decrypted: {decrypted}")