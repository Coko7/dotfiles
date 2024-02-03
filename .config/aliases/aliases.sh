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

# Core commands
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# ls
alias ls='eza --icons -a --group-directories-first'
# alias ls='ls --color=auto'
alias ll='ls -alF'

# pacman
alias paci='sudo pacman -S'               # install
#alias pachi='sudo pacman -Ql'             # Pacman Has Installed - what files where installed in a package
alias pacs='sudo pacman -Ss'              # search
alias pacu='sudo pacman -Syu'             # update
alias pacr='sudo pacman -R'               # remove package but not dependencies
#alias pacrr='sudo pacman -Rs'             # remove package with unused dependencies by other softwares
#alias pacrc='sudo pacman -Sc'             # remove pacman's cache
#alias pacro='pacman -Rns $(pacman -Qtdq)'
#alias pacrl='rm /var/lib/pacman/db.lck'   # pacman remove locks
alias pacls="sudo pacman -Qe"
#alias pacc='sudo pacman -Sc'
#alias paccc='sudo pacman -Scc'            # empty the whole cache
alias pacbak="sudo pacman -Qe > `date +"%d%m%Y-%H%M"`.txt" # Backup explicitly installed packages to a text file

# APT (Debian)
alias aptu='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias aptar='sudo apt autoremove'

# Common
alias vim='nvim'
alias v='nvim'
alias fs='ranger'
alias soz="source $ZDOTDIR/.zshrc"
alias lock='betterlockscreen -l dim'
alias twitch-dl="$SCRIPTS/twitch-dl/twitch-dl.2.1.3.pyz"

# Keyboard quick switch
alias kb='sudo setxkbmap -layout'

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

# .dotfiles git alias
alias dtf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
