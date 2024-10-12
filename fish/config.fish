set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias vv="nvim"
alias nvimdiff="nvim -d"
alias emacs="emacs -nw"

source ~/.local/share/toolcat-comp

set PATH $PATH:~/.local/bin/

#NNN
export NNN_PLUG='p:preview-tui;t:preview-tabbed'
set --export NNN_FIFO "/tmp/nnn.fifo"
