# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Hyprland with uwsm
if uwsm check may-start; then 
  exec uwsm start default
fi

# Automatically start or attach to a tmux session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Aliases
alias update="sudo pacman -Syu && flatpak update && paru"
alias vbackup="git add . && git commit -m \"vault backup: $(date +'%Y-%m-%d %H:%M:%S')\""
alias .files="cd ~/.files"

# Custom prompt
PROMPT_GREEN="green"
PROMPT_RED="red"
PROMPT_CYAN="cyan"
PROMPT_BLUE="blue"
PROMPT_YELLOW="yellow"

PROMPT="%(?:%{$fg_bold[${PROMPT_GREEN}]%}%1{%n%}:%{$fg_bold[${PROMPT_RED}]%}%1{%n%}) %{$fg[${PROMPT_CYAN}]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[${PROMPT_BLUE}]%}git:(%{$fg[${PROMPT_RED}]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[${PROMPT_BLUE}]%}) %{$fg[${PROMPT_YELLOW}]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[${PROMPT_BLUE}]%})"
