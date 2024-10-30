#!/usr/bin/env bash

case $TMUX_WS_TYPE in
    "WORK")
        alias b="browse_thor_work"
        alias v="vim_thor_work"
        ;;
    # "PERSONAL") 
    *)
        alias b="browse_thor_perso"
        alias v="vim_thor_perso"
        ;;
esac

function browse_thor_work() {
    local global=$XDG_CONFIG_HOME/selekthor/browse_global.txt
    local work=$XDG_CONFIG_HOME/selekthor/browse_work.txt

    pick=`cat $global $work | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi

    $SCRIPTS/web-open.sh $pick
}

function browse_thor_perso() {
    local global=$XDG_CONFIG_HOME/selekthor/browse_global.txt
    local perso=$XDG_CONFIG_HOME/selekthor/browse_perso.txt

    pick=`cat $global $perso | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi

    $SCRIPTS/web-open.sh $pick
}

function vim_thor_work() {
    local global=$XDG_CONFIG_HOME/selekthor/vim_global.txt
    local work=$XDG_CONFIG_HOME/selekthor/vim_work.txt

    pick=`cat $global $work | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi

    vim "$pick"
}

function vim_thor_perso() {
    local global=$XDG_CONFIG_HOME/selekthor/vim_global.txt
    local perso=$XDG_CONFIG_HOME/selekthor/vim_perso.txt

    pick=`cat $global $perso | sort | selekthor $@`
    if [ -z "$pick" ]; then
        return 1
    fi

    vim "$pick"
}
