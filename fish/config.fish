set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \ec accept-autosuggestion

export TERM=xterm-256color

export EDITOR="nvim"

# Pyenv
pyenv init - fish | source


# Aliases
alias vv="nvim"
alias nn="nnn"
alias nvimdiff="nvim -d"
alias emacs="emacs -nw"

source ~/.local/share/toolcat-comp

set PATH $PATH:~/.local/bin/

#NNN
export NNN_PLUG='p:preview-tui;d:dragdrop'
export NNN_USE_EDITOR=1
set --export NNN_FIFO "/tmp/nnn.fifo"

#Pyenv
pyenv init - | source
