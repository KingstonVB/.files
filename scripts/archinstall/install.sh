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

source $SCRIPTS/aur.sh
source $SCRIPTS/packages.sh

source $SCRIPTS/powerprofile.sh

source $SCRIPTS/firewall.sh

source $SCRIPTS/theme.sh
