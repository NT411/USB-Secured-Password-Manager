#!/usr/bin/env python3
import curses, json, pyperclip
from pathlib import Path
import os
from cryptography.fernet import Fernet  

USER = os.environ.get("SUDO_USER") or os.environ["USER"]
VAULT_DIR = Path(f"/home/{USER}/mnt/usb_secure")
VAULT_FILE = VAULT_DIR / "vault.json"
KEY_FILE = VAULT_DIR / "vault.key"

# check USB + key file
if not VAULT_DIR.exists() or not KEY_FILE.exists():
    print("❌ Secure USB not mounted or missing key. Please run 'usbon'.")
    exit(1)

# load encryption key
vault_key = KEY_FILE.read_bytes()
fernet = Fernet(vault_key)

# vault data
vault = {}
if VAULT_FILE.exists():
    vault = json.loads(fernet.decrypt(VAULT_FILE.read_bytes()).decode())

def save():
    data = json.dumps(vault, indent=2).encode()
    VAULT_FILE.write_bytes(fernet.encrypt(data))
    os.chmod(VAULT_FILE, 0o600) 
def add_password(stdscr):
    curses.echo()
    stdscr.clear()
    stdscr.addstr(0,0,"Service name: ")
    name = stdscr.getstr().decode()
    stdscr.addstr(1,0,"Username: ")
    user = stdscr.getstr().decode()
    stdscr.addstr(2,0,"Password: ")
    pwd = stdscr.getstr().decode()
    vault[name] = {"username":user,"password":pwd}
    save()
    curses.noecho()
    stdscr.addstr(4,0,"✅ Saved! Press any key...")
    stdscr.getch()

def view_details(stdscr, service):
    while True:
        stdscr.clear()
        u,p = vault[service]["username"], vault[service]["password"]
        options = ["Copy username","Copy password","Back"]
        stdscr.addstr(0,0,f"Service: {service}")
        stdscr.addstr(1,0,f"Username: {u}")
        stdscr.addstr(2,0,f"Password: {p}")
        idx = 0
        while True:
            for i,opt in enumerate(options):
                if i==idx:
                    stdscr.attron(curses.A_REVERSE)
                    stdscr.addstr(i+4,0,opt)
                    stdscr.attroff(curses.A_REVERSE)
                else:
                    stdscr.addstr(i+4,0,opt)
            key = stdscr.getch()
            if key == curses.KEY_UP: idx = (idx-1)%len(options)
            elif key == curses.KEY_DOWN: idx = (idx+1)%len(options)
            elif key in [curses.KEY_ENTER,10,13]:
                if options[idx]=="Copy username": pyperclip.copy(u)
                elif options[idx]=="Copy password": pyperclip.copy(p)
                elif options[idx]=="Back": return
                break

def edit_details(stdscr, service):
    curses.echo()
    stdscr.clear()
    stdscr.addstr(0,0,f"Edit Service (old: {service})")
    stdscr.addstr(1,0,"New service name: ")
    newname = stdscr.getstr().decode()
    stdscr.addstr(2,0,"New username: ")
    newuser = stdscr.getstr().decode()
    stdscr.addstr(3,0,"New password: ")
    newpwd = stdscr.getstr().decode()
    curses.noecho()
    # update vault
    del vault[service]
    vault[newname] = {"username":newuser,"password":newpwd}
    save()
    stdscr.addstr(5,0,"✅ Updated! Press any key...")
    stdscr.getch()

def password_menu(stdscr, service):
    idx = 0
    options = ["View details","Edit details","Delete","Back"]
    while True:
        stdscr.clear()
        stdscr.addstr(0,0,f"Service: {service}")
        for i,opt in enumerate(options):
            if i==idx:
                stdscr.attron(curses.A_REVERSE)
                stdscr.addstr(i+2,0,opt)
                stdscr.attroff(curses.A_REVERSE)
            else:
                stdscr.addstr(i+2,0,opt)
        key = stdscr.getch()
        if key == curses.KEY_UP: idx = (idx-1) % len(options)
        elif key == curses.KEY_DOWN: idx = (idx+1) % len(options)
        elif key in [curses.KEY_ENTER,10,13]:
            if options[idx]=="View details": view_details(stdscr, service)
            elif options[idx]=="Edit details": edit_details(stdscr, service); return
            elif options[idx]=="Delete": del vault[service]; save(); return
            elif options[idx]=="Back": return

def menu(stdscr):
    curses.curs_set(0)
    idx = 0
    while True:
        stdscr.clear()
        options = ["Add password"] + list(vault.keys()) + ["Quit"]
        stdscr.addstr(0,0,"Password Manager")
        for i,opt in enumerate(options):
            if i==idx:
                stdscr.attron(curses.A_REVERSE)
                stdscr.addstr(i+2,0,opt)
                stdscr.attroff(curses.A_REVERSE)
            else:
                stdscr.addstr(i+2,0,opt)
        key = stdscr.getch()
        if key == curses.KEY_UP: idx = (idx-1) % len(options)
        elif key == curses.KEY_DOWN: idx = (idx+1) % len(options)
        elif key in [curses.KEY_ENTER,10,13]:
            choice = options[idx]
            if choice=="Add password": add_password(stdscr)
            elif choice=="Quit": break
            else: password_menu(stdscr, choice)

def main(stdscr):
    curses.start_color()
    curses.use_default_colors()
    menu(stdscr)

if __name__=="__main__":
    curses.wrapper(main)
