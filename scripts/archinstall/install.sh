#!/bin/bash
set -e

SCRIPTS=~/install-scripts
REPO=https://raw.githubusercontent.com/K-Bayard/.files/refs/heads/main/scripts/archinstall/install-scripts

install_text() {
    clear
    echo "$1"
    echo
}

install_text "Installing needed files"
mkdir install-scripts
cd install-scripts
curl -O $REPO/aur.sh
curl -O $REPO/packages.sh
curl -O $REPO/dotfiles.sh
curl -O $REPO/powerprofile.sh
curl -O $REPO/firewall.sh
curl -O $REPO/theme.sh
curl -O $REPO/oh-my-zsh.sh
curl -O $REPO/p10k.sh
cd ~

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