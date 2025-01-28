#!/usr/bin/env bash

# +--------------+
# | X11 SPECIFIC |
# +--------------+

alias xpropc='xprop | grep WM_CLASS'        # display xprop class
alias xop='xdg-open'                        # open file with default app
#alias xop='wslview'                        # WSL only
alias monsel="$SCRIPTS/x-mon-select.sh"     # x-mon-select allows to pick a monitor setup before starting x-server
alias xdpi="xrdb -query | grep Xft.dpi | awk '{print \$2}'"

# +-----------+
# | CLIPBOARD |
# +-----------+

# alias cbi='win32yank.exe -i'                  # WSL only: copy IN
# alias cbi='xclip -selection clipboard'        # X11 only: copy IN
alias cbi='wl-copy'                             # Wayland only: copy IN

# alias cbo='xclip -o -selection clipboard'     # X11 only: copy OUT
alias cbo='wl-paste'                            # Wayland only: copy OUT

# +----------+
# | KEYBOARD |
# +----------+

alias kbs="$SCRIPTS/switch-keyboard-hyprland.sh"    # Hyprland
# alias kbs="$SCRIPTS/switch-keyboard-x11.sh"       # X11

# +-----------------+
# | PACMAN COMMANDS |
# +-----------------+

# alias paci='sudo pacman -S'                 # install
paci() { pkgstats search "$1" && sudo pacman -S "$1"; }
#alias pachi='sudo pacman -Ql'              # Pacman Has Installed - what files where installed in a package
alias pacs='sudo pacman -Ss'                # search
alias pacu='sudo pacman -Syu'               # update
alias pacr='sudo pacman -R'                 # remove package but not dependencies
#alias pacrr='sudo pacman -Rs'              # remove package with unused dependencies by other softwares
#alias pacrc='sudo pacman -Sc'              # remove pacman's cache
#alias pacro='pacman -Rns $(pacman -Qtdq)'
#alias pacrl='rm /var/lib/pacman/db.lck'    # pacman remove locks
alias pacls="pacman -Qe"
alias pacll="pacman -Q"
#alias pacc='sudo pacman -Sc'
#alias paccc='sudo pacman -Scc'             # empty the whole cache
alias pacbak="sudo pacman -Qe > `date +"%d%m%Y-%H%M"`.txt" # Backup explicitly installed packages to a text file

# +--------------+
# | APT COMMANDS |
# +--------------+

alias aptu='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias aptar='sudo apt autoremove'

# +----------+
# | LS / EZA |
# +----------+

# better ls aliases using eza

alias ezaic='eza --icons --group-directories-first'
alias ls='ezaic'
alias l='ezaic -l'
alias lsd='ezaic -d */'
alias ll='ezaic -alF'
alias lls='ezaic -ralF -s modified'
alias lld='ezaic -alF -d */'
alias la='ezaic -A'
alias lst='ezaic --tree --no-permissions --no-filesize --no-user --no-time'

# classic ls aliases (if not using eza)

# alias ls='ls --color=auto'
# alias l='ls -l'
# alias lsd='ls -d */'
# alias ll='ls -halF'
# alias lls='ls -halFtr'
# alias lld='ls -halF -d */'
# alias la='ls -A'
# alias lc='ls -CF'

# +-------------+
# | YAZI HELPER |
# +-------------+

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# +------+
# | MISC |
# +------+

# wget
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# grep
alias grep='grep --color=auto'

# cal
alias cal='cal --monday --week'

# dust
# alias dust='du -sh * | sort -hr'

# anyone? Check if I have internet
# alias any1='ping 8.8.8.8'
alias any1='gping archlinux.org'

# Core commands
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# bat help highlighting
alias bathelp='bat --plain --language=help'
help() { "$@" --help 2>&1 | bathelp; }

# Common
alias vim='nvim'
alias soz="source $ZDOTDIR/.zshrc"
alias lock='betterlockscreen -l dim'
alias twitch-dl="$SCRIPTS/twitch-dl/twitch-dl.2.1.3.pyz"
alias battery="acpi -b | grep -P -o '[0-9]+(?=%)'"
# alias kb='sudo setxkbmap -layout'       # Keyboard quick switch

function fzfip() {
    fzf --preview="$SCRIPTS/fzf-preview.sh {}"
}

alias mux="$SCRIPTS/tmux/start-env.sh"
# alias tmuxs="$SCRIPTS/tmux/sessionizer.sh"
# alias tmuxw="$SCRIPTS/tmux/windowizer.sh"

# Kizaru-warp
# alias j='kizaru-warp'
# alias jj='kizaru-warp --awakened'

function chill() {
    num=$((1 + $RANDOM % 6))
    if [ "$num" = "1" ]; then DISPLAY= cacafire; fi
    if [ "$num" = "2" ]; then nyancat; fi
    if [ "$num" = "3" ]; then cmatrix; fi
    if [ "$num" = "4" ]; then $SCRIPTS/pipes.sh; fi
    if [ "$num" = "5" ]; then $SCRIPTS/rick-roll.sh; fi
    if [ "$num" = "6" ]; then cava; fi
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
