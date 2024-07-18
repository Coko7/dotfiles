#!/usr/bin/env bash

def_wp_dir="$HOME/Pictures/Wallpapers"

# If no arg supplied, pick random img from default wallpapers dir
if [ "$#" -eq 0 ]; then
    # pick=$(fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' | shuf -n1)
    feh --no-fehbg --bg-fill --randomize --recursive $def_wp_dir
else
    # If arg is dir, take random image from it
    if [ -d "$1" ]; then
        feh --no-fehbg --bg-fill --randomize --recursive $1
    # If arg if an image file, set is as wp otherwise exit with failure
    else
        declare file_path="$1"

        if [ ! -f "$file_path" ]; then
            echo "No such file: $file_path"
            exit 1
        fi

        file_type=`file -b --mime-type "$file_path"`

        if [[ $file_type == image/* ]]; then
            feh --no-fehbg --bg-fill $file_path
            exit 0
        fi

        echo "Not wallpaper material: $file_path"
        exit 1
    fi
fi

#feh --no-fehbg --bg-scale '/home/coco/Pictures/Wallpapers/kame-house.jpg' 
#fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' -0 | shuf -n1 -z | xargs -0 feh --no-fehbg --bg-fill
