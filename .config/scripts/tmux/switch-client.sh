#!/usr/bin/env bash

function toggle-switch() {
    CURRENT_SESSION=`tmux display-message -p '#S'`
    OTHER_SESSION=`tmux list-sessions -F "#{session_name}" | fzf -f "!$CURRENT_SESSION"`
    tmux switch-client -t $OTHER_SESSION 
}

# function fuzzy-switch() {
#     res=`tmux list-sessions -F "#{session_name}" | fzf`
#     tmux neww 'echo test'
# }

SESSION_COUNT=`tmux list-sessions | wc -l`

case $SESSION_COUNT in
    0) echo "No tmux server running" >&2; exit 1 ;;
    1) exit 0 ;;
    2) toggle-switch; exit 0 ;;
    # *) fuzzy-switch; exit 0 ;;
    *) echo "Only supports MAX 2 sessions for now" >&2; exit 1 ;;
esac
