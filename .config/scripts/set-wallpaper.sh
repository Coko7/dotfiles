#!/usr/bin/env bash

def_wp_dir="$HOME/Pictures/Wallpapers"

__set_dir_wallp() {
    local dir=$1

    if [ -d "$dir" ]; then
        feh --no-fehbg --bg-fill --randomize --recursive $dir
        return 0
    else
        echo "set-wallpaper: Not a directory: $dir"
        return 1
    fi
}

__set_img_wallp() {
    local file_path=$1

    if [ ! -f "$file_path" ]; then
        echo "set-wallpaper: No such file: $file_path"
        return 1
    fi

    local file_type=`file -b --mime-type "$file_path"`

    if [[ $file_type == image/* ]]; then
        feh --no-fehbg --bg-fill $file_path
        return 0
    fi

    echo "set-wallpaper: Not wallpaper material: $file_path"
    return 1
}

__normal_mode() {
    local path
    if [ $# -eq 0 ]; then
        path="$def_wp_dir"
    else
        path=$1
    fi

    if [ -d "$path" ]; then
        __set_dir_wallp $path
    else
        __set_img_wallp $path
    fi

    return 0
}

__interactive_mode() {
    local dir
    if [ $# -eq 0 ]; then
        dir="$def_wp_dir"
    else
        dir=$1
    fi

    if [ -d "$dir" ]; then
        paths=`find $dir -mindepth 1 2>/dev/null`
        pick=`echo "$paths" | fzf | head -n 1`

        if [ -z $pick ]; then
            return 1
        fi

        __set_path_wallp $pick
    else
        echo "set-wallpaper: Interactive mode only works if a directory is supplied"
        return 1
    fi
}

__set_path_wallp() {
    local path
    if [ $# -eq 0 ]; then
        path="$def_wp_dir"
    else
        path=$1
    fi

    if [ -d "$path" ]; then
        __set_dir_wallp $path
    else
        __set_img_wallp $path
    fi

    return 0
}

# If no arg supplied, pick random img from default wallpapers dir
if [ "$#" -eq 0 ]; then
    # pick=$(fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' | shuf -n1)
    feh --no-fehbg --bg-fill --randomize --recursive $def_wp_dir
else
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: set-wallpaper [OPTION] [PATH]"
        echo "Attempts to set the wallpaper image(s)"
        echo "If no [PATH] supplied, the default wallpapers dir will be used"
        echo "Example: set-wallpaper --interactive /path/to/wallpapers\n"
        echo "Options:"
        echo "\t-i, --interactive       select entries using fzf"
        echo "\t-h, --help              display this help text and exit"      
        # echo "\t-v, --version           display version information and exit"
        return 0
    fi

    if [ "$1" = "--interactive" ] || [ "$1" = "-i" ]; then
        __interactive_mode $2
    else
        __normal_mode $1
    fi
fi

#feh --no-fehbg --bg-scale '/home/coco/Pictures/Wallpapers/kame-house.jpg' 
#fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' -0 | shuf -n1 -z | xargs -0 feh --no-fehbg --bg-fill
