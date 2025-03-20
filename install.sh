#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Exec script with root, please"
    exit 1
fi

echo "---HELLO AND WELCOME ABOARD---"

echo "sxhkd & exec bspwm" > ~/.xinitrc

pacman -S --noconfirm \
    xorg \
    bspwm \
    sxhkd \
    sddm \
    picom \
    fish \
    git \
    udisks2 \
    i3lock \
    polybar \
    gcc \
    nodejs \
    npm \
    rofi \
    kitty \
    neovim \
    ranger \
    htop \
    firefox \
    chromium \
    obsidian \
    fd \
    flameshot \
    sxiv \
    tmux \
    zathura \
    syncthing

git clone https://github.com/justTrueCodeWriter/ArchConfig
mv ArchConfig/* ~/.config/

# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Would you like to setup hacker workspace? (y/n)"
read ans

if [ "$ans" = "y" ]; then
    pacman -S --noconfirm \
        openvpn \
        nmap \
        aircrack-ng \
        inetutils
fi

echo "-----SETUP COMPLETE!-----"

