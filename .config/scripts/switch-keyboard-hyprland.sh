#!/usr/bin/env bash

# ================================ WARNING ==================================== #
#                                                                               #
# This script only works with Hyprland compositor / Window manager for Wayland. #
#                                                                               #
# ================================ WARNING ==================================== #

function get_main_keyboard() {
    hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .name'
}

KEYBOARD=`get_main_keyboard`

function set_fr_azerty() {
    # ID 1 for FR (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 1 \
        && notify-send -t 2000 "Keyboard Layout" "AZERTY Baguette" -i "$HOME/Pictures/System/azerty_icon2.png" -r 123
}

function set_us_qwerty() {
    # ID 0 for EN (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 0 \
        && notify-send -t 2000 "Keyboard Layout" "QWERTY Burger" -i "$HOME/Pictures/System/kb_us_qwerty3.png" -r 123
}

function set_us_dvorak() {
    # ID 2 for Dvorak (see hyprland.conf)
    hyprctl switchxkblayout $KEYBOARD 2 \
        && notify-send -t 2000 "Keyboard Layout" "QWERTY Dvorak" -i "$HOME/Pictures/System/kb_us_dvorak.png" -r 123
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
