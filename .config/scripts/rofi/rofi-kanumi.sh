#!/usr/bin/env bash

function choice_prompt() {
    PROMPT="  Kanumi "
    CHOICE=`echo -e "󰥨 Directory\n󰥷 Image\n󰒓 Configure" | rofi -dmenu -p "$PROMPT" -i -theme-str 'window {width: 250px; height: 230px;}'`
    CHOICE=`echo $CHOICE | cut -d' ' -f2- | tr '[:upper:]' '[:lower:]'`
    echo $CHOICE
}

function pick_image() {
    pick=`kanumi -t $MODE | cut -d'/' -f6- | rofi -dmenu -display-columns 1 -p " 󰥷 Image " -theme-str 'window {width: 50%;}'`
    if [[ -z "$pick" ]]; then
        exit 1
    fi

    pick_full="$WALLPAPERS_DIR/$pick"

    # get monitor names
    monitor_names=`hyprctl monitors all -j | jq '.[].name' | tr -d '"'`

    # set wallpaper for each monitor
    for monitor in $monitor_names; do
        swww img -o $monitor $pick_full -t outer
    done
}

function pick_dir() {
    pick=`kanumi -t $MODE | cut -d'/' -f6- | rofi -dmenu -display-columns 1 -p " 󰥨 Directory " -theme-str 'window {width: 50%;}'`
    if [[ -z "$pick" ]]; then
        exit 1
    fi

    wp_dir="$WALLPAPERS_DIR/$pick"

    monitor_names=`hyprctl monitors all -j | jq '.[].name' | tr -d '"'`

    # set wallpaper for each monitor
    for monitor in $monitor_names; do
        # img=`get_rand_img $wp_dir`
        img=`kanumi --type image --score 0..1 $wp_dir | shuf | head -n 1`
        swww img -o $monitor $img -t outer
    done
}

function edit_config() {
    xdg-open $XDG_CONFIG_HOME/kanumi/config.toml
}

MODE=`choice_prompt`
case "$MODE" in
    directory) pick_dir;;
    image) pick_image;;
    configure) edit_config;;
    *) exit 1;;
esac
