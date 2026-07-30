#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Exec script with root, please"
    exit 1
fi

echo "---HELLO AND WELCOME ABOARD---"

echo "sxhkd & 
exec bspwm" > ~/.xinitrc

pacman -S --noconfirm \
    xorg \
    bspwm \
    sxhkd \
    sddm \
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
    yazi \
    htop \
    chromium \
    fd \
    feh \
    flameshot \
    sxiv \
    tmux \
    zathura \
    syncthing

git clone https://github.com/justTrueCodeWriter/ArchConfig
mv ArchConfig/* .config/ # TODO: change move dirs to symlinks setup

# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

systemctl enable sddm.service

echo 
read -p "Would you like to setup CTF workspace? (y/n): " ans

if [ "$ans" = "y" ]; then
    pacman -S --noconfirm \
        openvpn \
        nmap \
        aircrack-ng \
        inetutils
fi

echo
echo "-----SETUP COMPLETE!-----"

