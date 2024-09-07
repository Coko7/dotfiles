#!/usr/bin/env bash

function tmux-start-env() {
    if [ -n "$1" ]; then
        opts="-f $1"
    fi

    spaces="Personal,Work"
    pick=`echo $spaces | tr ',' '\n' | fzf $opts --prompt="Pick env > "`

    case $pick in
        "Personal")
            session_name="Perso-Mux"
            ws_type="PERSO"
            ;;
        "Work")
            session_name="Work-Mux"
            ws_type="WORK"
            ;;
        *) return 1 ;;
    esac

    tmux new-session -s "$session_name" -e TMUX_WS_TYPE="$ws_type"
}

tmux-start-env $@
