echo "---HELLO AND WELCOME ABOARD---"
echo "sxhkd & exec bspwm" > ~/.xinitrc;
pacman -S xorg bspwm sxhkd sddm picom fish udisks2 i3lock polybar gcc nodejs npm rofi kitty neovim ranger htop firefox chromium obsidian fd flameshot sxiv tmux zathura syncthing;

git clone https://github.com/justTrueCodeWriter/ArchConfig;
mv ArchConfig/* ~./config/

#--vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Would you like setup hacker workspace? (y/n)";
read ans;

if [ $ans = "y" ]; then
	pacman -S openvpn nmap aircrack-ng inetutils;
fi

echo "-----SETUP COMPLETE!-----"
