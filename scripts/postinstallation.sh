#!/usr/bin/zsh

# Exit if a command exits with a non-zero status
set -e

# Variables
DOTFILES_REPO="git@github.com:K-Bayard/.files.git"

# --- Installation Functions --- #
setup_git() {
    echo "Updating pacman..."
    sudo pacman -Syu
        
    echo "Installing git"
    sudo pacman -Sy git
        
    echo "Configuring git"
    read -p "Enter git username" GIT_USERNAME
    git config --global user.name $GIT_USERNAME
    echo "Git username set to: $GIT_USERNAME"
    
    read -p "Enter git email" GIT_EMAIL
    git config --global user.email $GIT_EMAIL
    echo "Git email set to: $GIT_EMAIL"
    
    read -p "Default branch name" GIT_BRANCH
    git config --global init.defaultBranch $GIT_BRANCH
    echo "Default branch set to: $GIT_BRANCH"
    
    echo "Git configured..."
}

install_packages() {
    echo "Updating Pacman..."
    sudo pacman -Syu
        
    echo "Installing Official Packages..."
    sudo pacman -Sy hyprland ripgrep unzip fastfetch man tldr ghostty neovim zed pavucontrol rofi-wayland bitwarden tmux
        
    echo "Installing yay for AUR packages..."
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    
    echo "Installing AUR packages..."
    yay zen-browser-bin legcord-bin
        
    echo "All packages installed..."
}

clone_repositories() {
    echo "Cloning .files..."
    cd ~
    git clone $DOTFILES_REPO
    
    echo "Respositories cloned..."
}

setup_dotfiles() {
    echo "Setting up .files..."
    echo "Creating symlinks..."
    ln -sf $HOME/.files/.zshrc $HOME/
    ln -sf $HOME/.files/.gitconfig $HOME/
    ln -sf $HOME/.files/hypr $HOME/.config/
    ln -sf $HOME/.files/ghostty $HOME/.config/
    ln -sf $HOME/.files/zed $HOME/.config/
    ln -sf $HOME/.files/nvim $HOME/.config/
    ln -sf $HOME/.files/.tmux.conf $HOME/
    ln -sf $HOME/.files/tmux $HOME/.config/
    
    echo ".files linked to thier directories"
}

configurations() {
    echo "Configuring SSH Agent..."
    bitwarden-desktop
    echo "Login to bitwarden..."
    echo "After loging into bitwarden run ssh git@github.com to c"
    ssh git@github.com 
}

# --- Main Installation --- #
echo "Starting installation..."

if ["$EUID" -eq 0]; then
    echo "Running as root is not recommended"
    echo "The script calls commands to run sudo as sudo permissions are needed"
    exit 1
fi

install_packages
clone_repositories
setup_dotfiles

echo "Installation finished!.."
