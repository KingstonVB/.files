#!/bin/bash
set -e

rm -r ~/.config/{hypr,ghostty,zed} && stow hypr ghostty zed --target=$HOME/
rm ~/.bashrc && stow bashrc --target=$HOME/
