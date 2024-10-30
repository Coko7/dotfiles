#!/usr/bin/env bash

function main() {
    link=$1

    case $TMUX_WS_TYPE in
        "WORK")
            firefox -P "Work" -new-tab $link
            ;;
        # "PERSONAL") 
            *)
            firefox -new-tab $link
            ;;
    esac
}

main "$@"; exit
