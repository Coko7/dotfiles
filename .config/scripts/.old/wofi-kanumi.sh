#!/usr/bin/env bash

pick=`kanumi -t i | wofi --dmenu --prompt "Pick image"`

# get monitor names
monitor_names=`hyprctl monitors all -j | jq '.[].name' | tr -d '"'`

# set wallpaper for each monitor
for monitor in $monitor_names; do
    swww img -o $monitor $pick -t fade
done
