#!/usr/bin/env bash

pick=`echo -e "󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍃 Logout\n󰌾 Lock" | wofi --dmenu --prompt "Action:" -i -W 20% -H 25%`
formatted_pick=`echo $pick | awk '{print $2}'`

case $formatted_pick in

    "Shutdown")
        choice=`echo -e "Yes\nNo" | wofi --dmenu --prompt "UNPLUGGING ME???" -W 15% -H 20%`
        case $choice in
            Yes)
                systemctl poweroff
                ;;
            *)
                ;;
        esac
        ;;
    "Reboot")
        choice=`echo -e "Yes\nNo" | wofi --dmenu --prompt "Time for a REBOOT?" -W 15% -H 20%`
        case $choice in
            Yes)
                systemctl reboot
                ;;
            *)
                ;;
        esac
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Logout")
        choice=`echo -e "Yes\nNo" | wofi --dmenu --prompt "U sure about logging out?" -W 15% -H 20%`
        case $choice in
            Yes)
                loginctl terminate-session
                ;;
            *)
                ;;
        esac
        ;;
    "Lock")
        loginctl lock-session
        notify-send "Locking..."
        ;;
esac
