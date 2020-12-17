#!/bin/sh

# this script puts my dotfiles in this directory to push them to github

mkdir -p .config/alacritty
mkdir -p .config/i3
mkdir -p .config/polybar
mkdir -p .config/rofi
mkdir -p .config/nvim
mkdir -p .config/ncmpcpp
mkdir -p .config/xfce4/xfconf/xfce-perchannel-xml/
mkdir wallpapers
cp ~/.config/picom.conf .config/picom.conf
cp ~/.config/i3/config .config/i3/config
cp -r ~/.config/alacritty .config/
# cp ~/.config/polybar/config .config/polybar/config
cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml 
cp ~/.config/rofi/oxide.rasi .config/rofi/oxide.rasi
cp ~/.config/nvim/init.vim .config/nvim/init.vim
cp ~/.config/ncmpcpp/config .config/ncmpcpp/config
cp ~/.zshrc .zshrc
cp ~/.p10k.zsh .p10k.zsh
cp -r ~/wallpapers ./
cp -r ~/stuff ./
