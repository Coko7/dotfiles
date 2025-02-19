#!/usr/bin/env bash

function __start_tmux_env() {
    local session_name="$1"
    local ws_type="$2"
    local todo_path="$3"

    tmux has-session -t $session_name 2>/dev/null

    # If session does not exist, set it up
    if [ $? != 0 ]; then
        # Create new session (detached) and set name, custom env var, working dir and rename window
        tmux new-session -d -s $session_name -e TMUX_WS_TYPE=$ws_type -c $todo_path
        tmux rename-window -t $session:1 "$ws_type TODO"

        # Open TODO notes
        tmux send-keys -t $session_name 'vim todo.md' C-m

        # Split horizontally and open Backlog notes
        tmux split-window -h -c "#{pane_current_path}" -t $session_name
        tmux send-keys -t $session_name 'vim backlog.md' C-m
    fi

    tmux attach-session -t $session_name
}

function tmux-start-env() {
    if [ -n "$1" ]; then
        opts="-f $1"
    fi

    spaces="Personal,Work"
    pick=`echo $spaces | tr ',' '\n' | fzf $opts --prompt="Pick env > "`

    case $pick in
        "Personal") __start_tmux_env "Perso-Mux" "PERSO" "$PROJ_PERSO/Notes/todo-log" ;;
        "Work") __start_tmux_env "Work-Mux" "WORK" "$PROJ_WORK/Signifikant/notes/work-log" ;;
        *) return 1 ;;
    esac
}

tmux-start-env $@
