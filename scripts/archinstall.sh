#!/bin/bash
set -euo pipefail

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

##########################
## Install Applications ##
##########################

flatpak remote-add --if-not-exists flathub
flatpak install --noninteractive flathub "${FLATPAK_PACKAGES[@]}"

paru -S --needed --noconfirm  "${AUR_PACKAGES[@]}"

########################
## Configure Dotfiles ##
########################

######################
## Configure Docker ##
######################

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
sudo systemctl enable docker

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}

# Prevent Docker from preventing boot for network-online.target
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
[Unit]
Wants=
After=network.target
EOF

sudo systemctl daemon-reload

########################
## Configure Firewall ##
########################

# Allow nothing in, everything out
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow ports for LocalSend
sudo ufw allow 53317/udp
sudo ufw allow 53317/tcp

# Allow SSH in
sudo ufw allow 22/tcp

# Allow Docker containers to use DNS on host
sudo ufw allow in on docker0 to any port 53

# Turn on the firewall
sudo ufw enable

# Turn on Docker protections
sudo ufw-docker install
sudo ufw reload

##########################
## Configure Dark Theme ##
##########################

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

#############################
## Set Performance Profile ##
#############################

powerprofilesctl set performance || true