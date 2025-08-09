#!/bin/bash
set -e

SCRIPTS=~/archinstall/install-scripts
REPO=https://github.com/K-Bayard/.files/tree/main/scripts/archinstall

install_text() {
    clear
    echo "$1"
    echo
}

install_text "Installing needed files"
mkdir archinstall
cd archinstall
curl -o $REPO/install.sh
mkdir install-scripts
cd install-scripts
curl -o $REPO/install-scripts/{aur.sh,dotfiles.sh,firewall.sh,oh-my-zsh.sh,p10k.sh,packages.sh,powerprofile.sh,theme.sh}

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

install_text "ZSH Stuff"
read -rp "Do you want to configure OHZ now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Installing OMZ"
    source $SCIPRTS/oh-my-zsh.sh
    echo "Installed"
else
    echo "Not installing OMZ"
fi

install_text "Powerlevel 10k stuff"
read -rp "Do you want to configure p10k now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Installing p10k"
    source $SCRIPTS/p10k.sh
    echo "Installed"
else
    echo "Not installing p10k"
fi

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