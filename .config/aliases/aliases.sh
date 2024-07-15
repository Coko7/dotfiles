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

# better ls aliases using eza
alias ezaic='eza --icons --group-directories-first'
alias ls='ezaic'
alias l='ezaic -l'
alias lsd='ezaic -d */'
alias ll='ezaic -alF'
alias lls='ezaic -ralF -s modified'
alias lld='ezaic -alF -d */'
alias la='ezaic -A'

# classic ls aliases (if not using eza)
# alias ls='ls --color=auto'
# alias l='ls -l'
# alias lsd='ls -d */'
# alias ll='ls -halF'
# alias lls='ls -halFtr'
# alias lld='ls -halF -d */'
# alias la='ls -A'
# alias lc='ls -CF'

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

# bat help highlighting
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# Common
alias vim='nvim'
alias soz="source $ZDOTDIR/.zshrc"
alias lock='betterlockscreen -l dim'
alias twitch-dl="$SCRIPTS/twitch-dl/twitch-dl.2.1.3.pyz"
alias setwp="$SCRIPTS/set-wallpaper.sh"
alias tmuxs="$SCRIPTS/tmux/tmux-sessionizer.sh"
alias tmuxw="$SCRIPTS/tmux/tmux-windowizer.sh"
# alias flazshbak="cat $HISTFILE | fzf | cut -d';' -f2 | cb"

# V3 shows the full list of frequently used directories
# as well as their sub-directories. It is used for changing directory
# to most places in a very intuitive manner.
# source "$SCRIPTS/jump-dir/jump-dir-v3.sh"
# alias j='jump_dir_v3'

# V2 shows a smaller list than V3 (only the most frequent directories).
# The advantage of V2 is that each directory entry has a key which can be used
# to quickly travel there.
# While it may handle fewer destinations than V3, it handles them better thanks to pre-set keys.
# source "$SCRIPTS/jump-dir/jump-dir-v2.sh"
# alias jj='jump_dir_v2'

# Kizaru-warp
alias j='kizaru_warp'
alias jj='kizaru_warp --awakened'

# Keyboard quick switch
alias kb='sudo setxkbmap -layout'

function chill() {
    num=$((1 + $RANDOM % 5))
    if [ "$num" = "1" ]; then cacafire; fi
    if [ "$num" = "2" ]; then nyancat; fi
    if [ "$num" = "3" ]; then cmatrix; fi
    if [ "$num" = "4" ]; then ~/pipes.sh-1.3.0/pipes.sh; fi
    if [ "$num" = "5" ]; then $SCRIPTS/rick_roll.sh; fi
}

function weather() {
  if [ -z "$2" ]; then
    curl wttr.in/${1}
  else
    # passing "v2" as argument will display more info (like sunrise / sunset)
    curl "wttr.in/${1}?format=${2}"
  fi
}

# CD quick aliases (From https://stackoverflow.com/q/23456873)
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# .dotfiles git alias
alias dtf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
