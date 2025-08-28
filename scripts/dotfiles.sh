#!/bin/bash
set -e

git clone https://github.com/KingstonVB/.files.git ~/Documents/
cd ~/Documents/.files/
rm -r ~/.config/{hypr,ghostty,zed} && stow hypr ghostty zed --target=$HOME/
rm ~/.bashrc && stow bashrc --target=$HOME/
