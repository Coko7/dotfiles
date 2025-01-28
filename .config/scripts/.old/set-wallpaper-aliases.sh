#!/usr/bin/env bash

# set-wallpaper
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
        preview_cmd="eza -alF --color=always --icons {}"
    fi

    pick=`echo "$results" | fzf --preview $preview_cmd | head -n 1`

    if [ -z $pick ]; then
        return 1
    fi

    set-wallpaper $pick
}

setwpca() { echo "set-wallpaper-cache: $SET_WP_LAST_PICK" && set-wallpaper $SET_WP_LAST_PICK; }
setwpid() { __set_wallpaper_interactive 'd' $1; }
setwpii() { __set_wallpaper_interactive 'f' $1; }
