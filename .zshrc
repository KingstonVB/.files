# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto

zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Hyprland with uwsm
if uwsm check may-start; then 
  exec uwsm start hyprland.desktop
fi

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bitwarden
export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

# Aliases
alias update="sudo pacman -Syu && flatpak update && yay"

# Oh My Posh
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json')"
