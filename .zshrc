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

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet arch_desktop)

# Automatically start or attach to a tmux session
if command -v tmux &> /dev/null; then
    case $- in
        *i*)
            if [ -z "$TMUX_PANE" ]; then
                tmux has-session &> /dev/null
                if [ $? -eq 0 ]; then
                    tmux attach-session
                else
                    tmux new-session
                fi
            fi
            ;;
    esac
fi

# Custom prompt
PROMPT="%(?:%{$fg_bold[green]%}%1{%n%}:%{$fg_bold[red]%}%1{%n%}) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
