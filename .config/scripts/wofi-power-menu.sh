#!/usr/bin/env bash

function confirm_prompt() {
    prompt=$1 
    choice=`echo -e "Yes\nNo" | wofi --dmenu --prompt $prompt -W 15% -H 20%`

    if [ "$choice" != "Yes" ]; then
        return 1
    fi

    return 0
}

pick=`echo -e "󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍃 Logout\n󰌾 Lock" | wofi --dmenu --prompt "Action:" -i -W 20% -H 25%`
formatted_pick=`echo $pick | awk '{print $2}'`

case $formatted_pick in

    "Shutdown")
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
        notify-send "Locking..."
        ;;
esac
