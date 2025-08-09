#!/bin/bash
set -e

SCRIPTS=~/archinstall/install-scripts

install_text() {
    clear
    echo "$1"
    echo
}

install_text "Configuring Paru and installing packages"
source $SCRIPTS/aur.sh
source $SCRIPTS/packages.sh

install_text "Setting up dotfiles"
source $SCRIPTS/dotfiles.sh

install_text "Setting power profile to performance"
source $SCRIPTS/powerprofile.sh

install_text "Setting up and restricting firewall"
source $SCRIPTS/firewall.sh

install_text "Setting up themese"
source $SCRIPTS/theme.sh

install_text "Updating system"
sudo pacman -Syu
flatpak update
paru -Sau

install_text "Everything should be configured..."
read -rp "Do you want to remove downloaded files? (y/N): " remove_choice
if [[ "$remove_choice" =~ ^[Yy]$ ]]; then
    echo "Removing downloaded files..."
    rm -rf ~/archinstall
    echo "Files removed"
else
    echo "Keeping files"
fi

read -rp "Do you want to reboot now? (y/N): " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
    echo "Rebooting..."
    sleep 2
    reboot
else
    echo "Remember to reboot later"
fi