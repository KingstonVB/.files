#!/bin/bash
##################
## Install Paru ##
##################

sudo pacman -Syu --noconfirm
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd -
rm -rf paru
cd ~