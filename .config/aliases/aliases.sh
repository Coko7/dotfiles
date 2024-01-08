#!/usr/bin/env bash

# X11
alias xpropc='xprop | grep WM_CLASS' # display xprop class
alias xop='xdg-open' # open file with default app
#alias xop='wslview' # WSL only

alias cb='xclip -selection clipboard'
#alias cb='win32yank.exe -i' # WSL only

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

# Upgrade (Debian only)
#alias upgrates='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias vim='nvim'
alias fs='ranger'
alias soz="source $ZDOTDIR/.zshrc"
alias lock='betterlockscreen -l dim'
alias twitch-dl="$HOME/scripts/twitch-dl/twitch-dl.2.1.3.pyz"

function weather() {
  if [ -z "$2" ]; then
    curl wttr.in/${1}
  else
    # passing "v2" as argument will display more info (like sunrise / sunset)
    curl "wttr.in/${1}?format=${2}"
  fi
}

# CD quick aliases
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
