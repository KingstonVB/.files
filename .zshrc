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

# Aliases
alias update="sudo pacman -Syu && flatpak update && yay"

# ssh-agent auto start
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Automatically start or attach to a tmux session
if command -v tmux &> /dev/null; then
    # Check if we are in an interactive shell
    case $- in
        *i*)
            # If TMUX_PANE is not set, we are not inside a tmux session
            if [ -z "$TMUX_PANE" ]; then
                # Check if there's an existing session
                tmux has-session &> /dev/null
                if [ $? -eq 0 ]; then
                    # Attach to the last session
                    tmux attach-session
                else
                    # Create a new session if none exists
                    tmux new-session
                fi
            fi
            ;;
    esac
fi

# Oh My Posh
export PATH=$PATH:/home/poppy/.local/bin

eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json')"

