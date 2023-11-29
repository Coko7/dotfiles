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
alias gg='git grep -n'
alias ggu='git grep -n --no-index'
alias upgrates='sudo apt update && apt list --upgradable && sudo apt upgrade'
alias ggv='function _f(){ git grep -n $1 | grep -v $2 | grep -n --color=always $1 | less; }; _f'
alias grasp='function grasp(){ grep -inr "$1" --exclude-dir={obj,bin} --exclude=\*.min.\*; }; grasp'
#alias nvim='~/nvim-linux64/bin/nvim'
alias vim='nvim'
alias fs='ranger'
alias soz='source $ZDOTDIR/.zshrc'

# Vim aliases
alias valias='vim $XDG_CONFIG_HOME/aliases/aliases.sh'
alias vgalias='vim $XDG_CONFIG_HOME/aliases/gitaliases.sh'
alias vjump='vim $XDG_CONFIG_HOME/aliases/kjump.sh'
alias vzsh='vim $ZDOTDIR/.zshrc'
alias vspace='vim $ZDOTDIR/spaceship.zsh'
alias vmux='vim $XDG_CONFIG_HOME/tmux/tmux.conf'

# Source Marco Fontani's custom git-grepblame command
# See: https://blog.darkpan.com/posts/git-grepblame/
source $HOME/scripts/git-grepblame.sh

function weather() {
  curl wttr.in/${1}
}

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
