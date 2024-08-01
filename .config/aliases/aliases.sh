#!/usr/bin/env bash

# X11
alias xpropc='xprop | grep WM_CLASS'        # display xprop class
alias xop='xdg-open'                        # open file with default app
#alias xop='wslview'                        # WSL only
alias monsel="$SCRIPTS/x-mon-select.sh"     # x-mon-select allows to pick a monitor setup before starting x-server
alias xdpi="xrdb -query | grep Xft.dpi | awk '{print \$2}'"
alias cbi='xclip -selection clipboard'      # copy to clipboard
#alias cbi='win32yank.exe -i'               # WSL only: copy to cliboard
alias cbo='xclip -o -selection clipboard'   # get clipboard content

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
#alias pacc='sudo pacman -Sc'
#alias paccc='sudo pacman -Scc'             # empty the whole cache
alias pacbak="sudo pacman -Qe > `date +"%d%m%Y-%H%M"`.txt" # Backup explicitly installed packages to a text file

# APT (Debian)
alias aptu='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias aptar='sudo apt autoremove'

# bat help highlighting
alias bathelp='bat --plain --language=help'
help() { "$@" --help 2>&1 | bathelp; }

# Common
alias vim='nvim'
alias soz="source $ZDOTDIR/.zshrc"
alias lock='betterlockscreen -l dim'
alias twitch-dl="$SCRIPTS/twitch-dl/twitch-dl.2.1.3.pyz"
alias setwp="set-wallpaper"

__set_wallpaper_interactive() {
    local node_type=$1
    local root_wp_path
    if [ $# -eq 1 ]; then
        root_wp_path=$WALLPAPERS_DIR
    else
        root_wp_path=$2
    fi

    results=`find $root_wp_path -mindepth 1 -type $node_type 2>/dev/null`
    if [ "$node_type" = "f" ]; then
        preview_cmd="$SCRIPTS/fzf-preview.sh {}"
    else
        preview_cmd="eza -alF --icons {}"
    fi

    pick=`echo "$results" | fzf --preview $preview_cmd | head -n 1`

    if [ -z $pick ]; then
        return 1
    fi

    setwp $pick
}

setwpca() { echo "set-wallpaper-cache: $MY_LAST_WP_SELECT" && set-wallpaper $MY_LAST_WP_SELECT; }
setwpid() { __set_wallpaper_interactive 'd' $1; }
setwpii() { __set_wallpaper_interactive 'f' $1; }

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
alias j='kizaru-warp'
alias jj='kizaru-warp --awakened'

# Keyboard quick switch
alias kb='sudo setxkbmap -layout'

alias battery="acpi -b | grep -P -o '[0-9]+(?=%)'"

function chill() {
    num=$((1 + $RANDOM % 5))
    if [ "$num" = "1" ]; then DISPLAY= cacafire; fi
    if [ "$num" = "2" ]; then nyancat; fi
    if [ "$num" = "3" ]; then cmatrix; fi
    if [ "$num" = "4" ]; then $SCRIPTS/pipes.sh; fi
    if [ "$num" = "5" ]; then $SCRIPTS/rick-roll.sh; fi
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

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#
# Credit to @jkishner for https://gist.github.com/jkishner/2fccb24640a27c2d7ac9
#
# Also interesting: https://gist.github.com/cdown/1163649
#
function url_encode() {
    echo "$@" \
    | sed \
        -e 's/%/%25/g' \
        -e 's/ /%20/g' \
        -e 's/!/%21/g' \
        -e 's/"/%22/g' \
        -e "s/'/%27/g" \
        -e 's/#/%23/g' \
        -e 's/(/%28/g' \
        -e 's/)/%29/g' \
        -e 's/+/%2b/g' \
        -e 's/,/%2c/g' \
        -e 's/-/%2d/g' \
        -e 's/:/%3a/g' \
        -e 's/;/%3b/g' \
        -e 's/?/%3f/g' \
        -e 's/@/%40/g' \
        -e 's/\$/%24/g' \
        -e 's/\&/%26/g' \
        -e 's/\*/%2a/g' \
        -e 's/\./%2e/g' \
        -e 's/\//%2f/g' \
        -e 's/\[/%5b/g' \
        -e 's/\\/%5c/g' \
        -e 's/\]/%5d/g' \
        -e 's/\^/%5e/g' \
        -e 's/_/%5f/g' \
        -e 's/`/%60/g' \
        -e 's/{/%7b/g' \
        -e 's/|/%7c/g' \
        -e 's/}/%7d/g' \
        -e 's/~/%7e/g'
}

function url_decode() {
    echo "$@" \
    | sed \
        -e 's/%25/%/g' \
        -e 's/%20/ /g' \
        -e 's/%21/!/g' \
        -e 's/%22/"/g' \
        -e "s/%27/'/g" \
        -e 's/%23/#/g' \
        -e 's/%28/(/g' \
        -e 's/%29/)/g' \
        -e 's/%2b/+/g' \
        -e 's/%2c/,/g' \
        -e 's/%2d/-/g' \
        -e 's/%3a/:/g' \
        -e 's/%3b/;/g' \
        -e 's/%3f/?/g' \
        -e 's/%40/@/g' \
        -e 's/%24/\$/g' \
        -e 's/%26/\&/g' \
        -e 's/%2a/\*/g' \
        -e 's/%2e/\./g' \
        -e 's/%2f/\//g' \
        -e 's/%5b/\[/g' \
        -e 's/%5c/\\/g' \
        -e 's/%5d/\]/g' \
        -e 's/%5e/\^/g' \
        -e 's/%5f/_/g' \
        -e 's/%60/`/g' \
        -e 's/%7b/{/g' \
        -e 's/%7c/|/g' \
        -e 's/%7d/}/g' \
        -e 's/%7e/~/g'
}

urle() { local input="$(< /dev/stdin)"; url_encode $input; }
urld() { local input="$(< /dev/stdin)"; url_decode $input; }
