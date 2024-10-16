#!/usr/bin/env bash

case $TMUX_WS_TYPE in
    "WORK")
        alias b="browse_thor_work"
        alias v="vim_thor"
        ;;
    # "PERSONAL") 
    *)
        alias b="browse_thor_perso"
        alias v="vim_thor"
        ;;
esac

function browse_thor_work() {
    local global=$XDG_CONFIG_HOME/selekthor/browse_global.txt
    local work=$XDG_CONFIG_HOME/selekthor/browse_work.txt

    pick=`cat $global $work | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    firefox -P "Work" -new-tab "$pick"
}

function browse_thor_perso() {
    local global=$XDG_CONFIG_HOME/selekthor/browse_global.txt
    local perso=$XDG_CONFIG_HOME/selekthor/browse_perso.txt

    pick=`cat $global $perso | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    firefox -new-tab "$pick"
}

function vim_thor() {
    local global=$XDG_CONFIG_HOME/selekthor/vim_global.txt

    pick=`cat $global | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi
    vim "$pick"
}
