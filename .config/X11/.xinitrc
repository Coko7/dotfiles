#!/usr/bin/env bash

userresources=$XDG_CONFIG_HOME/X11/.Xresources
usermodmap=$XDG_CONFIG_HOME/X11/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[[ -f $sysresources ]] && xrdb -merge $sysresources
[[ -f $sysmodmap ]] && xmodmap $sysmodmap
[[ -f "$userresources" ]] && xrdb -merge "$userresources"
[[ -f "$usermodmap" ]] && xmodmap "$usermodmap"

# start some nice programs
nm-applet &
flameshot &
sxhkd &

# set desktop background with custom effect
betterlockscreen -w dim

# set screen layout depending on external monitor
if [ "${X_MY_LOC}" = "curry" ]; then
    xrdb -merge "$XDG_CONFIG_HOME/screenlayout/xresources-curry"
    "$XDG_CONFIG_HOME/screenlayout/multi-monitor-curry.sh"
elif [ "${X_MY_LOC}" = "geo" ]; then
    xrdb -merge "$XDG_CONFIG_HOME/screenlayout/xresources-geo"
    "$XDG_CONFIG_HOME/screenlayout/multi-monitor-geo.sh"
elif [ "${X_MY_LOC}" = "geo-cinema" ]; then
    xrdb -merge "$XDG_CONFIG_HOME/screenlayout/xresources-geo"
    "$XDG_CONFIG_HOME/screenlayout/multi-monitor-geo-cinema.sh"
else
    xrandr --auto
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Run window manager
exec awesome
