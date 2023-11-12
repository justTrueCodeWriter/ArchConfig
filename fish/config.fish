set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias nvimdiff="nvim -d"
alias emacs="emacs -nw"

source ~/.local/share/toolcat-comp

set PATH $PATH:~/.local/bin/
