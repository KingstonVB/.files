# OMZ Configurations
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# PROMPT
PROMPT="%B%{$fg[red]%}[%{$fg[blue]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# Auto Update
# if [ "$(date +%u)" -eq 6 ]; then
#     while true; do
#         echo "It is Saturday! do you wish to update? (y/n)"
#         read -r response
#         if [ "$response" = "y" ]; then
#             echo "Updating system"
#             update
#             break
#         elif [ "$response" = "n" ]; then
#             echo "Will ask again in 1 hour."
#             sleep 3600
#         else
#             echo "Invalid response. Please type 'y' for yes or 'n' for no."
#         fi
#     done
# fi

# Tmux

# Hyprland with uwsm
if uwsm check may-start; then
  exec uwsm start default
fi

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Aliases
alias update="sudo pacman -Syu && flatpak update && paru -Sua"
alias vbackup="git add . && git commit -m \"vault backup: $(date +'%Y-%m-%d %H:%M:%S')\""
alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias rm="trash -v"
alias ff="fastfetch"

# Fucntions
cd() {
    if [ -n "$1" ];
    then
        builtin cd "$@" && ls
    else
        builtin cd ~ && ls
    fi
}

# Zoxide init
eval "$(zoxide init zsh)"
