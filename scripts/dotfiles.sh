#!/bin/bash
set -e

rm -r ~/.config/{hypr,ghostty,zed} && rm ~/.bashrc
stow hypr ghostty zed bashrc --target=$HOME/
