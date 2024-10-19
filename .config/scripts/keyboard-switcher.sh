#!/usr/bin/env bash

function set_fr_azerty() {
    setxkbmap -layout "fr" \
        && notify-send "Keyboard Layout" "AZERTY Baguette" -i "$HOME/Pictures/System/azerty_icon2.png"
}

function set_us_dvorak() {
    setxkbmap -layout "us" -variant "dvorak" \
        && notify-send "Keyboard Layout" "QWERTY Dvorak" -i "$HOME/Pictures/System/kb_us_dvorak.png"
}

function set_us_qwerty() {
    setxkbmap -layout "us" \
        && notify-send "Keyboard Layout" "QWERTY Burger" -i "$HOME/Pictures/System/kb_us_qwerty3.png"
}

if [ -n "$1" ]; then
    if [ "$1" == "dvorak" ]; then
        set_us_dvorak
        exit 0
    fi
fi

current_layout=`setxkbmap -query | grep layout | awk '{print $2}'`

if [ "$current_layout" == "us" ]; then
    set_fr_azerty
# elif [ "$current_layout" == "fr" ]; then
else
    set_us_qwerty
fi
