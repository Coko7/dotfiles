#!/usr/bin/env bash

function get_main_keyboard() {
    hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .name'
}

function get_kb_layout() {
    local keyboard=$1
    if [ -z "$keyboard" ]; then
        echo "hyprkeyb: get_kb_layout expects a keyboard" >&2
        return 1
    fi

    hyprctl devices -j | jq -r ".keyboards[] | select(.name == \"$keyboard\") | .active_keymap"
}

function set_kb_layout() {
    local keyboard=$1
    local layout=$2
    if [[ -z "$keyboard" || -z "$layout" ]]; then
        echo "hyprkeyb: set_kb_layout expects two args (keyboard, layout)" >&1
        return 1
    fi

    # To understand the 0, 1, 2 values, see hyprland.conf
    case $layout in
        "us" |"English (US)")               hyprctl switchxkblayout $keyboard 0 ;;
        "fr" |"French")                     hyprctl switchxkblayout $keyboard 1 ;;
        "dvo"|"dvorak"|"English (Dvorak)")  hyprctl switchxkblayout $keyboard 2 ;;
        *) echo "hyprkeyb: unknown keyboard layout: $layout" >&2; exit 1 ;;
    esac

    pkill -RTMIN+8 waybar
}

MAIN_KEYBOARD=`get_main_keyboard`

if [[ -z "$1" || "$1" = "help" || "$1" = "-h" ]]; then
    echo "Usage: hyprkeyb <COMMAND> [ARG]"
    echo "Options:"
    echo " get-kb                   get your main keyboard"
    echo " get-all-layouts          get the list of supported keyboard layouts"
    echo " get-active-layout        get your active keyboard layout"
    echo " set-layout               change your keyboard layout to [LAYOUT]"
    echo " help                     display this help text and exit"      
    exit 0
fi

if [ "$1" = "get-kb" ]; then
    echo $MAIN_KEYBOARD
elif [ "$1" = "get-all-layouts" ]; then
    echo "[{\"name\": \"English (US)\"}, {\"name\": \"French\"}, {\"name\": \"English (Dvorak)\"}]";
elif [ "$1" = "get-active-layout" ]; then
    get_kb_layout $MAIN_KEYBOARD
elif [ "$1" = "set-layout" ]; then
    set_kb_layout $MAIN_KEYBOARD "$2"
else
    echo "hyprkeyb: unknown command '$1'" >&2
    exit 1
fi
