#!/usr/bin/env bash

# ================================ WARNING ==================================== #
#                                                                               #
# This script only works with Hyprland compositor / Window manager for Wayland. #
#                                                                               #
# ================================ WARNING ==================================== #

function get_main_keyboard() {
    hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .name'
}

function notif() {
    local title=$1
    local body=$2
    local img="$HOME/Pictures/System/$3"
    local time=$4

    notify-send -u low "$title" "$body" \
        -i "$img" -t $time \
        -h string:x-canonical-private-synchronous:sw-kb --transient
}

KEYBOARD=`get_main_keyboard`

function set_fr_azerty() {
    # ID 1 for FR (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 1 \
        && notif "Keyboard Layout" "AZERTY Baguette" "azerty_icon2.png" 2000
}

function set_us_qwerty() {
    # ID 0 for EN (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 0 \
        && notif "Keyboard Layout" "QWERTY Burger" "kb_us_qwerty3.png" 2000
}

function set_us_dvorak() {
    # ID 2 for Dvorak (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 2 \
        && notif "Keyboard Layout" "QWERTY Dvorak" "kb_us_dvorak.png" 2000
}


function get_current_layout() {
    hyprctl devices -j | jq -r ".keyboards[] | \
        select(.name == \"$KEYBOARD\") | .active_keymap"
        # | cut -c1-2 | tr 'a-z' 'A-Z'
}

if [ -n "$1" ]; then
    if [ "$1" == "dvorak" ]; then
        set_us_dvorak
        exit 0
    fi
fi

current_layout=`get_current_layout`

if [ "$current_layout" == "English (US)" ]; then
    set_fr_azerty
elif [ "$current_layout" == "English (Dvorak)" ]; then
    set_us_qwerty
else
    set_us_qwerty
fi
