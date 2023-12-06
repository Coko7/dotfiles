#!/usr/bin/env bash

# X11
alias xpropc='xprop | grep WM_CLASS' # display xprop class

# wget
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# grep
alias grep='grep --color=auto'

# dust
alias dust='du -sh * | sort -hr'

# anyone? Check if I have internet
alias any1='ping 8.8.8.8'

alias ls='eza --icons -a --group-directories-first'
alias ll='ls -alF'
alias upgrates='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias vim='nvim'
alias fs='ranger'
alias soz='source $ZDOTDIR/.zshrc'

function weather() {
  curl wttr.in/${1}
}

# CD quick aliases
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
