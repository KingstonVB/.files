# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ Configurations
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Aliases
alias update="sudo pacman -Syu && flatpak update && paru -Sua"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
