# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"

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

# Aliases
alias update="sudo pacman -Syu && flatpak update && paru"
alias vbackup="git add . && git commit -m \"vault backup: $(date +'%Y-%m-%d %H:%M:%S')\""

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Automatically start or attach to a tmux session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
	if ! systemctl --user is-active --quiet tmux.service; then
	    systemctl --user start tmux.service
	fi
	exec tmux attach-session -d -t "${USER}" >/dev/null 2>&1
fi

# Custom prompt
PROMPT="%(?:%{$fg_bold[green]%}%1{%n%}:%{$fg_bold[red]%}%1{%n%}) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
