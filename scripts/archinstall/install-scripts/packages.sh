#!/bin/bash
##################
## Applications ##
##################
FLATPAK_PACKAGES=(
    com.github.tchx84.Flatseal
    org.vinegarhq.Sober
    org.onlyoffice.desktopeditors
    com.github.PintaProject.Pinta
    com.saivert.pwvucontrol
    io.typora.Typora
)

AUR_PACKAGES=(
    hyprsysteminfo
    lazydocker-bin
    legcord-bin
    ttf-ia-writer
    walker-bin
    yaru-icon-theme
    ufw-docker
)

##########################
## Install Applications ##
##########################

flatpak install --noninteractive flathub "${FLATPAK_PACKAGES[@]}"
paru -S --needed --noconfirm  "${AUR_PACKAGES[@]}"