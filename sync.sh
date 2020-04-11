#!/bin/sh

# this script puts my dotfiles in this directory, and pushes them to github

mkdir -p .config/alacritty
mkdir -p .config/i3
mkdir -p .config/polybar
mkdir -p .config/rofi
cp ~/.config/picom.conf .config/picom.conf
cp ~/.config/i3/config .config/i3/config
cp ~/.config/alacritty/alacritty.yml .config/alacritty/alacritty.yaml
cp ~/.config/polybar/config .config/polybar/config
cp ~/.config/rofi/oxide.rasi .config/rofi/oxide.rasi
cp ~/.zshrc .zshrc
cp -r ~/stuff stuff/
