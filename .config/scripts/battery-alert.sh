#!/usr/bin/env bash

acpi -b | grep -Poq 'Discharging'

# If grep succeeds, that means laptop is not plugged in
if [ $? -eq 0 ]; then
    battery_level=`cat /sys/class/power_supply/BAT1/capacity`

    if [ $battery_level -le 15 ]; then

        notify-send -u critical "System" \
            "Battery: $battery_level%\nYoooo!! PLUG ME NOOOOW!!!" \
            -i $HOME/Pictures/Memes/y-u-no.jpg \
            -h string:x-canonical-private-synchronous:bat-alert

    elif [ $battery_level -le 30 ]; then

        notify-send -u normal "System" \
            "Battery: $battery_level%\nGetting tired now, plug me soon pls" \
            -i $HOME/Pictures/System/battery_low.png \
            -h string:x-canonical-private-synchronous:bat-alert
    fi
fi
