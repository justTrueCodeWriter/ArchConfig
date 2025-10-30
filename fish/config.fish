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
alias nvimdiff="nvim -d"
alias emacs="emacs -nw"
alias yz="yazi"
alias dc="docker compose"
alias daily='vv ~/.symlinks/knowledge_vault/"Daily notes"/$(date +"%Y-%m-%d").md'

source ~/.local/share/toolcat-comp

set PATH $PATH:~/.local/bin/

#Pyenv
pyenv init - | source

set ANDROID_HOME ~/Android/Sdk
