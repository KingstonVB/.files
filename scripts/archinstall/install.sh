#!/bin/bash
set -e

REPO=https://raw.githubusercontent.com/K-Bayard/.files/refs/heads/main/srcipts/archinstall/install-scripts

install_text() {
    clear
    echo "$1"
    echo
}

install_text "Configuring Paru and installing packages"
sh -c "$(curl -fsSL $REPO/aur.sh)"
sh -c "$(curl -fsSL $REPO/packages.sh)"

install_text "Setting up dotfiles"
sh -c "$(curl -fsSL $REPO/dotfiles.sh)"

install_text "Setting power profile to performance"
sh -c "$(curl -fsSL $REPO/powerprofile.sh)"

install_text "Setting up and restricting firewall"
sh -c "$(curl -fsSL $REPO/firewall.sh)"

install_text "Setting up themese"
sh -c "$(curl -fsSL $REPO/theme.sh)"

install_text "Updating system"
sudo pacman -Syu
flatpak update
paru -Sau

install_text "ZSH Stuff"
read -rp "Do you want to configure OHZ now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Installing OMZ"
    sh -c "$(curl -fsSL $REPO/oh-my-zsh.sh)"
    echo "Installed"
else
    echo "Not installing OMZ"
fi

install_text "Powerlevel 10k stuff"
read -rp "Do you want to configure p10k now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Installing p10k"
    sh -c "$(curl -fsSL $REPO/p10k.sh)"
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