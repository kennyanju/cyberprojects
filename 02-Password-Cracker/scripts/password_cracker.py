import hashlib
import argparse
import os

def crack_password(target_hash, wordlist_path):
    """
    Attempts to crack the given hash using a wordlist.

    Args:
        target_hash (str): The hash to crack.
        wordlist_path (str): Path to the wordlist file.

    Returns:
        str: The cracked password if found, otherwise None.
    """
    try:
        with open(wordlist_path, 'r') as file:
            for line in file:
                password = line.strip()
                hashed_password = hashlib.sha256(password.encode()).hexdigest()
                if hashed_password == target_hash:
                    return password
    except FileNotFoundError:
        print(f"Error: Wordlist file '{wordlist_path}' not found.")
    except Exception as e:
        print(f"An error occurred: {e}")
    return None

def main():
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Password Cracker using SHA-256 and a wordlist.")
    parser.add_argument('--hash', required=True, help="The target hash to crack.")
    parser.add_argument('--wordlist', required=True, help="Path to the wordlist file.")
    args = parser.parse_args()

    # Validate wordlist path
    if not os.path.isfile(args.wordlist):
        print(f"Error: Wordlist file '{args.wordlist}' does not exist.")
        return

    # Attempt to crack the password
    print("Starting password cracking...")
    cracked_password = crack_password(args.hash, args.wordlist)

    if cracked_password:
        print(f"Password found: {cracked_password}")
    else:
        print("Password not found.")

if __name__ == "__main__":
    main()