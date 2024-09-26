#!/usr/bin/env bash

current_layout=`setxkbmap -query | grep layout | awk '{print $2}'`

if [ "$current_layout" == "us" ]; then
  next_layout="fr"
  layout_desc="AZERTY FR"
  icon_path="azerty_icon2.png"
elif [ "$current_layout" == "fr" ]; then
  next_layout="us"
  layout_desc="QWERTY US"
  icon_path="qwerty_icon2.png"
fi

setxkbmap -layout $next_layout && notify-send "Keyboard Layout" "$layout_desc" -i "$HOME/Pictures/System/$icon_path"
