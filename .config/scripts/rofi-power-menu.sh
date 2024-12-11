#!/usr/bin/env bash

function confirm_prompt() {
    prompt=$1 
    choice=`echo -e " Yes\n No" | rofi -dmenu -p "$prompt" -i -theme-str 'window {width: 10%; height: 10%;}'`

    if [ "$choice" != "Yes" ]; then
        return 1
    fi

    return 0
}

# options="󰐥 Power off\n󰜉 Reboot\n󰒲 Suspend\n󰍃 Logout\n󰌾 Lock\n󰸉 Wallpaper"
options="󰐥 Power off\n󰜉 Reboot\n󰒲 Suspend\n󰌾 Lock\n󰸉 Wallpaper"
pick=`echo -e $options | rofi -dmenu -p "󰒓 Action" -i -theme-str 'window {width: 10%; height: 22%;}'`
formatted_pick=`echo $pick | cut -d' ' -f2-`

case $formatted_pick in

    "Power off")
        confirm_prompt "󰋣 Bed time?"
        if [ $? -eq 0 ]; then
            systemctl poweroff
        fi
        ;;
    "Reboot")
        confirm_prompt "󰜉 Reboot?"
        if [ $? -eq 0 ]; then
            systemctl reboot
        fi
        ;;
    "Suspend")
        systemctl suspend
        ;;
    # "Logout")
    #     confirm_prompt "U sure about logging out?"
    #     if [ $? -eq 0 ]; then
    #         loginctl terminate-session
    #     fi
    #     ;;
    "Lock")
        loginctl lock-session
        ;;
    "Wallpaper")
        bash $SCRIPTS/rofi-kanumi.sh
        ;;
esac
