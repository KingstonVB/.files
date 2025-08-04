# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ Configurations
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION=
COMPLETION_WAITING_DOTS=

[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

# Env Variables
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Man Pages
export LESS_TERMCAP_mb=$'\e[1;31m'  # Begin blinking (red)
export LESS_TERMCAP_md=$'\e[1;32m'  # Begin bold (green)
export LESS_TERMCAP_me=$'\e[0m'     # End all modes (reset)
export LESS_TERMCAP_so=$'\e[01;44;33m'  # Begin standout mode (yellow on blue)
export LESS_TERMCAP_se=$'\e[0m'     # End standout mode (reset)
export LESS_TERMCAP_us=$'\e[1;4;31m'  # Begin underline (red underline)
export LESS_TERMCAP_ue=$'\e[0m'     # End underline (reset)
export LESS='-R -F -i -M -W -x4 -X'
export MANPAGER="less -R"
export MANROFFOPT="-c"

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
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
