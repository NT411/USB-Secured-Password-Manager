#!/bin/bash
# INSTALLING DEPENDENCIES
set -e
set -o pipefail
trap 'echo "❌ Error at line $LINENO: $BASH_COMMAND"' ERR

echo -e "
  ███████████    ███████╗███████╗ ██████╗██╗   ██╗██████╗ ███████╗ 
  █         █    ██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██╔════╝
  █ ███ ███ █    ███████╗█████╗  ██║     ██║   ██║██████╔╝█████╗ 
  █         █    ╚════██║██╔══╝  ██║     ██║   ██║██╔══██╗██╔══╝  
███████████████  ███████║███████╗╚██████╗╚██████╔╝██║  ██║███████╗ 
█             █  ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ 
█   ███████   █        
█  █       █  █        
█ ███████████ █  ██╗   ██╗███████╗██████╗       ██╗        ██████╗ 
█ ████   ████ █  ██║   ██║██╔════╝██╔══██╗     ███║       ██╔═══██╗
█ █████ █████ █  ██║   ██║███████╗██████╔╝     ╚██║       ██║   ██║
█ ███████████ █  ██║   ██║╚════██║██╔══██╗      ██║       ██║   ██║
█             █  ╚██████╔╝███████║██████╔╝      ██║  ██╗  ╚██████╔╝
 █████████████    ╚═════╝ ╚══════╝╚═════╝       ╚═╝  ╚═╝   ╚═════╝                                                                                                                                                                                                                                 
    "
echo " -----------------------------------------------------------"    
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"    
echo "  PLEASE SELECT DISTRO  "
echo "  ARCH/MANJARO   -> [1] "
echo "  FEDORA         -> [2] "
echo "  DEBIAN/UBUNTU  -> [3] "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
read -p "TYPE THE NUMBER OF YOUR DISTRO -> " distro

# validate input
while [[ "$distro" != "1" && "$distro" != "2" && "$distro" != "3" ]]; do
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "    !!!WRONG INPUT!!!   "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
    read -p "TYPE THE NUMBER OF YOUR DISTRO -> " distro
done

if [ "$distro" = "1" ]; then
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "  INSTALLING DEPENDENCIES  "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
    sudo pacman -Syu --noconfirm iptables iproute2 xclip sudo systemd python-pip python-virtualenv
    python -m venv .venv
    source .venv/bin/activate
    pip install cryptography pyperclip
    pip install argon2-cffi
    deactivate

elif [ "$distro" = "2" ]; then
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "  INSTALLING DEPENDENCIES  "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
    sudo dnf install -y iptables iproute xclip systemd sudo python3-pip python3-virtualenv
    python3 -m venv .venv
    source .venv/bin/activate
    pip install cryptography pyperclip
    pip install argon2-cffi
    deactivate

elif [ "$distro" = "3" ]; then
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "  INSTALLING DEPENDENCIES  "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
    sudo apt update
    sudo apt install -y iptables iproute2 xclip systemd sudo python3-venv python3-pip
    python3 -m venv .venv
    source .venv/bin/activate
    pip install cryptography pyperclip
    pip install argon2-cffi
    deactivate
fi
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜ "
echo "  DEPENDENCIES HAVE BEEN INSTALLED STARTING USB SETUP  "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟ "
echo " -----------------------------------------------------------"
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜ "
echo "            HAVE YOU PLUGGED IN YOUR USB ?             "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟ "
echo " -----------------------------------------------------------"
read -p "TYPE IN ALL CAPS [YES/NO]: " answer 

while [[ "$answer" != "YES" ]]; do 
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "   PLEASE PLUG IN YOUR USB  "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
read -p "TYPE IN ALL CAPS [YES/NO]: " answer 
done
echo " -----------------------------------------------------------"
lsblk # List available drives
echo " -----------------------------------------------------------"
read -p "SELECT USB PATH [ example -> /dev/sdb ]: " usb_location
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "                       !!!WARNING!!!                        "
echo "            NEXT STEP WILL WIPE CLEAN YOUR USB              "
echo "         IF YOU WISH TO CONTINUE PLEASE TYPE : OKEY         "
echo "      IF YOU WISH TO STOP THE INSTALLATION TYPE : STOP      "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
read -p "[OKEY/STOP]: " answer
while [[ "$answer" != "OKEY" && "$answer" != "STOP" ]]; do
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "    !!!WRONG INPUT!!!     "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
read -p "TYPE IN ALL CAPS [OKEY/STOP]: " answer
done

if [ "$answer" = "OKEY" ]; then
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "        CONTINUING...     "
echo " ▙ ▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"

    sudo cryptsetup luksFormat "$usb_location"
    sudo cryptsetup open "$usb_location" secure_usb
    sudo mkfs.ext4 /dev/mapper/secure_usb
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "     USB HAS BEEN FORMATTED WITH LUKS     "
echo "  CREATING CRYPTOGRAPHY KEY WITH FERNET   "
echo "      THIS WILL TAKE A FEW MINUTES        "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
echo " -----------------------------------------------------------"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
mkdir -p "$USER_HOME/mnt/usb_secure"
sudo mount /dev/mapper/secure_usb "$USER_HOME/mnt/usb_secure"
    python3 -c "from cryptography.fernet import Fernet; import os; user=os.environ.get('SUDO_USER') or os.environ['USER']; home=os.path.expanduser(f'~{user}'); open(f'{home}/mnt/usb_secure/vault.key','wb').write(Fernet.generate_key())"
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "    SETTING UP USB PLUG UNPLUG ALIAS      "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
read -p "PLEASE TYPE THE TYPE OF SHELL YOU ARE USING [.bashrc/.zshrc]: " shell
RC_FILE="$USER_HOME/$shell"

# add aliases if not present
grep -qxF "alias usbon='sudo cryptsetup luksOpen /dev/sda secure_usb && sudo mount /dev/mapper/secure_usb $USER_HOME/mnt/usb_secure && sudo chown -R $USER:$USER $USER_HOME/mnt/usb_secure && chmod 600 $USER_HOME/mnt/usb_secure/vault.key'" "$RC_FILE" || \
    echo "alias usbon='sudo cryptsetup luksOpen /dev/sda secure_usb && sudo mount /dev/mapper/secure_usb $USER_HOME/mnt/usb_secure && sudo chown -R $USER:$USER $USER_HOME/mnt/usb_secure && chmod 600 $USER_HOME/mnt/usb_secure/vault.key'" >> "$RC_FILE"

grep -qxF "alias usboff='sudo umount $USER_HOME/mnt/usb_secure && sudo cryptsetup luksClose secure_usb'" "$RC_FILE" || \
    echo "alias usboff='sudo umount $USER_HOME/mnt/usb_secure && sudo cryptsetup luksClose secure_usb'" >> "$RC_FILE"

echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "     SHELL RESET --> source ~/.bashrc     "
echo "     TO MOUNT USB BASH --> usbon          "
echo "     TO UNMOUNT USB BASH --> usboff       "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "         INSTALLATION SUCCESSFUL          "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
elif [ "$answer" = "STOP" ]; then
echo " -----------------------------------------------------------"
echo " ▛▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝▝ ▜"
echo "     !!!STOPPING THE INSTALLATION!!!    "
echo " ▙▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▖▟"
echo " -----------------------------------------------------------"
fi







