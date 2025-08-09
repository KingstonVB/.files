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
    dev.vencord.Vesktop
)

AUR_PACKAGES=(
    hyprsysteminfo
    ttf-ia-writer
    walker-bin
    yaru-icon-theme
)

##########################
## Install Applications ##
##########################
flatpak install --noninteractive flathub "${FLATPAK_PACKAGES[@]}"
paru -S --needed --noconfirm  "${AUR_PACKAGES[@]}"