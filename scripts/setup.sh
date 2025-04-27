echo "Installing packages"
sudo pacman -Sy sway wlroots git wayland unzip cpufetch fastfetch zsh man tldr pipewire-audio piepwire-alsa pipewire wireplumber xorg-xwayland discord ghostty neovim zed pavucontrol rofi-wayland rofi-calc rofi-emoji rofimoji yt-dlp pipewire-pulse
echo "Packages Installed"

echo "Installing Paru"
mkdir apps
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd
echo "Paru Installed"

echo "Configuring TLDR"
tldr -u
echo "TLDR Configured"

echo "Confguring Git"
#Configure
echo "Git Configured"

echo "Configuring Folders"
cd ~/
mkdir projects
echo "Folders Configured"

echo "Configuring .files"
git clone https://github.com/Kings-B/.files.git
cd ~/.files/
git clone https://github.com/Kings-B/kickstart.nvim.git
mv ~/.files/kickstart.nvim ~/.files/nvim
cd ~/
mkdir -p ~/.config
ln -s ~/.files/ghostty ~/.config/
ln -s ~/.files/nvim ~/.config/
ln -s ~/.files/rofi ~/.config/
ln -s ~/.files/sway ~/.config/
ln -s ~/.files/tmux ~/.config/
ln -s ~/.files/zed ~/.config/
ln -s ~/.files/.zshrc ~/
ln -s ~/.files/.tmux.conf ~/

chmod +x ~/.files/scripts/cde.sh 
echo "Configured .files"

echo "Installing Zen Browser"
cd ~/apps/
mkdir ~/apps/zen-browser/
git clone https://github.com/zen-browser/desktop.git --rescurse-submodules
cd ~/apps/zen-browser/desktop


