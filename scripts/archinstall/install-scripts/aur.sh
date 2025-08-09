#!/bin/bash
##################
## Install Paru ##
##################

if ! command -v paru &>/dev/null; then
    sudo pacman -Syu --noconfirm
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd -
    rm -rf paru
    cd ~
fi