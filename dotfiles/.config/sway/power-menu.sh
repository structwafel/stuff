#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout\n Hibernate" | fuzzel -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                ;&
        hibernate)
                systemctl $op
                ;;
        lock)
        swaylock
                ;;
        logout)
                swaymsg exit
                ;;
esac