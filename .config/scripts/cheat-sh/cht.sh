#!/usr/bin/env bash

# Copied from ThePrimeagen:
# - GitHub: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh
# - Youtube video: https://youtu.be/hJzqEAf2U4I

langs="$SCRIPTS/cheat-sh/cht-languages"
cmds="$SCRIPTS/cheat-sh/cht-commands"

selected=`cat $langs $cmds | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "query: " query

if grep -qs "$selected" $langs; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl https://cht.sh/$selected/$query/\" & curl https://cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -R"
fi
