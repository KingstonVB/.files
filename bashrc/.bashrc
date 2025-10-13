# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

export LESS_TERMCAP_mb=$'\e[1;31m'     # Begin blinking (red)
export LESS_TERMCAP_md=$'\e[1;32m'     # Begin bold (green)
export LESS_TERMCAP_me=$'\e[0m'        # End all modes (reset)
export LESS_TERMCAP_so=$'\e[01;44;33m' # Begin standout mode (yellow on blue)
export LESS_TERMCAP_se=$'\e[0m'        # End standout mode (reset)
export LESS_TERMCAP_us=$'\e[1;4;31m'   # Begin underline (red underline)
export LESS_TERMCAP_ue=$'\e[0m'        # End underline (reset)
export LESS='-R -F -i -M -W -x4 -X'
export MANPAGER="less -R"
export MANROFFOPT="-c"

export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock
