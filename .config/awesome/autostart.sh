#!/usr/bin/env bash

run() {
    if ! pgrep -f "$1" ;
    then
        "$@"&
    fi
}

#run "megasync"
##run "xscreensaver -no-splash"
#run "/usr/bin/dropbox"
#run "insync start"

# System processes
run "nm-applet"
run "sxhkd"
run "picom"

# Misc apps
run "flameshot"
run "keepassxc"

# Messaging apps
run "webcord"
run "signal-desktop"

# Office apps
run "joplin-desktop"

source $SCRIPTS/set-wallpaper.sh
set-wallpaper

# run "$XDG_CONFIG_HOME/polybar/launch.sh"
#run "/usr/bin/redshift"
##run "mpd"
##run "nm-applet"
