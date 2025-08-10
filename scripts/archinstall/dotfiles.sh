#!/bin/bash
set -e

git clone git@github.com:K-Bayard/.files.git ~/documents/
cd ~/documents/.files/
stow hypr ghostty nvim mako walker zed fastfetch zsh tmux
cp ~/documents/.files/.gitconfig ~/