#!/usr/bin/env bash

function confirm_prompt() {
    prompt=$1 
    choice=`echo -e "Yes\nNo" | wofi --dmenu --prompt "$prompt" -W 15% -H 20%`

    if [ "$choice" != "Yes" ]; then
        return 1
    fi

    return 0
}

pick=`echo -e "󰐥 Power off\n󰜉 Reboot\n󰒲 Suspend\n󰍃 Logout\n󰌾 Lock\n󰸉 Wallpaper" | wofi --dmenu --prompt "Action:" -i -W 25% -H 25%`
formatted_pick=`echo $pick | cut -d' ' -f2-`

case $formatted_pick in

    "Power off")
        confirm_prompt "UNPLUGGING ME???"
        if [ $? -eq 0 ]; then
            systemctl poweroff
        fi
        ;;
    "Reboot")
        confirm_prompt "Time for a REBOOT?"
        if [ $? -eq 0 ]; then
            systemctl reboot
        fi
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Logout")
        confirm_prompt "U sure about logging out?"
        if [ $? -eq 0 ]; then
            loginctl terminate-session
        fi
        ;;
    "Lock")
        loginctl lock-session
        ;;
    "Wallpaper")
        bash $SCRIPTS/wofi-kanumi.sh
        ;;
esac
