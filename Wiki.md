# Home configs
## Tmux
`~/.tmux.conf`
```conf
set-option -g default-shell /usr/bin/fish

bind-key j select-pane -D
bind-key k select-pane -U
bind-key h select-pane -L
bind-key l select-pane -R

bind-key t new-window -a
bind-key c clock-mode

set -g status-bg black
set -g status-fg white
```
# Keyboard
## Switchable keyboard layouts
Choose your preferred languages by uncomment you need in `/etc/locale.gen`.
For generate choosed languages:
`$ locale-gen`
Set keyboard configuration in `/etc/X11/xorg.conf.d/00-keyboard.conf`:
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc105+inet"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```
# Mouse
Example configuration in `/usr/share/X11/xorg.conf.d/40-libinput.conf`
```
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput keyboard catchall"
        MatchIsKeyboard "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        Driver "libinput"
	Option "Tapping" "on"
	Option "ClickMethod" "clickfinger"
	Option "TappingButtonMap" "lmr"
EndSection

Section "InputClass"
        Identifier "libinput touchscreen catchall"
        MatchIsTouchscreen "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput tablet catchall"
        MatchIsTablet "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection
```
