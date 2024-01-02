#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# set desktop background with custom effect
betterlockscreen -w dim

# Needed for SMB access (kiod5 auth) to work in Dolphin
# see: https://bbs.archlinux.org/viewtopic.php?id=285712
dbus-update-activation-environment --systemd --all

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

~/.screenlayout/multi-monitor-setup.sh

#/usr/bin/prime-offload
#~/scripts/set-wallpaper.sh &
# ~/scripts/natural-scrolling.sh
exec awesome
