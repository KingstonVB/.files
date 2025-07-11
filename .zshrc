# OMZ Configurations
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# PROMPT
PROMPT='[%F{green}%n %F{cyan}%c%f]$ '

# Hyprland with uwsm
if uwsm check may-start; then 
  exec uwsm start default
fi

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Aliases
alias update="sudo pacman -Syu && flatpak update && paru"
alias vbackup="git add . && git commit -m \"vault backup: $(date +'%Y-%m-%d %H:%M:%S')\""
alias .files="cd ~/.files"

# Zoxide init
eval "$(zoxide init bash)"
