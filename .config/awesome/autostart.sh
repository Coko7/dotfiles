#!/usr/bin/env bash

run() {
    if ! pgrep -f "$1" ;
    then
        "$@"&
    fi
}

exec --no-startup-id /usr/lib/pam_kwallet_init

#run "megasync"
##run "xscreensaver -no-splash"
#run "/usr/bin/dropbox"
#run "insync start"

# System processes
run "nm-applet"
run "sxhkd"
run "picom"
run "redshift"

# Misc apps
run "flameshot"
run "keepassxc"
# run "protonvpn-app"

# Messaging apps
run "webcord"
run "signal-desktop"

# Office apps
run "joplin-desktop"

. $SCRIPTS/set-wallpaper-script.sh

# run "$XDG_CONFIG_HOME/polybar/launch.sh"
#run "/usr/bin/redshift"
##run "mpd"
##run "nm-applet"
