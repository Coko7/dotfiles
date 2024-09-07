#!/usr/bin/env bash

case $TMUX_WS_TYPE in
    "WORK")
        alias b="browse_thor_work"
        alias v="vim_thor_perso"
        ;;
    # "PERSONAL") 
    *)
        alias b="browse_thor_perso"
        alias v="vim_thor_perso"
        ;;
esac

function browse_thor_work() {
    local FILE=$XDG_CONFIG_HOME/selekthor/browse_work.txt
    pick=`SELEK_FILE=$FILE selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    firefox -P "Work" -new-tab "$pick"
}

function browse_thor_perso() {
    local FILE="$XDG_CONFIG_HOME/selekthor/browse_perso.txt"
    pick=`SELEK_FILE=$FILE selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    firefox -new-tab "$pick"
}

function vim_thor_perso() {
    local FILE="$XDG_CONFIG_HOME/selekthor/vim_perso.txt"
    pick=`SELEK_FILE=$FILE selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    vim "$pick"
}
