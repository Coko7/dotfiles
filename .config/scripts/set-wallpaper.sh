#!/usr/bin/env bash

# Set env
# JSON is overkill but I just wanted to use jq for fun
export SET_WP_CFG="${SET_WP_CFG:-$XDG_CONFIG_HOME/set-wallpaper/config.jsonc}"

__set_dir_wallp() {
    local dir=$1

    if [ -d "$dir" ]; then
        feh --no-fehbg --bg-fill --randomize --recursive $dir
        return 0
    else
        >&2 echo "set-wallpaper: not a directory '$dir'"
        return 1
    fi
}

__set_img_wallp() {
    local file_path="$1"

    if [ ! -f "$file_path" ]; then
        >&2 echo "set-wallpaper: no such file '$file_path'"
        return 1
    fi

    local file_type=`file -b --mime-type "$file_path"`

    if [[ $file_type != image/* ]]; then
        >&2 echo "set-wallpaper: not wallpaper material '$file_path'"
        return 1
    fi

    feh --no-fehbg --bg-fill $file_path
    return 0
}

set-wallpaper() {
    # If no arg supplied, use the wallpapers directory from env
    if [ "$#" -eq 0 ]; then
        wp_path=`cat $SET_WP_CFG | jstc | jq '.pick' | tr -d '"' | envsubst`
    else
        if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
            echo "Usage: set-wallpaper [OPTION] [PATH]"
            echo "Attempts to set the wallpaper image(s)"
            echo "[PATH] may be either a directory or an image file"
            echo "If no [PATH] supplied, the default wallpapers dir will be used"
            echo "Example: set-wallpaper /path/to/wallpapers\n"
            echo "Options:"
            echo "\t-h, --help          display this help text and exit"      
            return 0
        fi

        local wp_path=$1
        export SET_WP_LAST_PICK=$wp_path
    fi

    if [ -d "$wp_path" ]; then
        __set_dir_wallp $wp_path
    else
        __set_img_wallp $wp_path
    fi

    return 0
}
