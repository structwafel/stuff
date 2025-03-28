#!/bin/bash

while true; do
    if [ -d /sys/class/power_supply/BAT0 ] || [ -d /sys/class/power_supply/BAT1 ]; then
        BAT=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo "N/A")
        BAT_STATUS=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null)
        if [ "$BAT_STATUS" = "Charging" ]; then
            # BAT_ICON="⚡"
            BAT_ICON="^"
        else
            BAT_ICON=" "
            # BAT_ICON="🔋"
        fi
        # echo "$(date +'%d-%m-%Y %H:%M:%S') |${BAT_ICON}${BAT}%"
        echo "$(date +'%d-%m-%Y %H:%M:%S')|${BAT}%${BAT_ICON}"
    else
        echo "$(date +'%d-%m-%Y %H:%M:%S')"
    fi
    sleep 1
done