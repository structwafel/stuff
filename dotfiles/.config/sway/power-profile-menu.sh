#!/bin/bash

current=$(powerprofilesctl get)

options=""
if [ "$current" = "performance" ]; then
    options+="Performance (active)\n"
else
    options+="Performance\n"
fi

if [ "$current" = "balanced" ]; then
    options+="Balanced (active)\n"
else
    options+="Balanced\n"
fi

if [ "$current" = "power-saver" ]; then
    options+="Power-saver (active)\n"
else
    options+="Power-saver\n"
fi

echo "Menu options: $options" >> $DEBUG_LOG

selected=$(echo -e "$options" | fuzzel -i --dmenu)
echo "Raw selection: '$selected'" >> $DEBUG_LOG

profile=$(echo "$selected" | sed 's/ (active)//g' | tr '[:upper:]' '[:lower:]')


# Apply power profile - use the correct case
case "$profile" in
    "performance")
        powerprofilesctl set performance
        ;;
    "balanced")
        powerprofilesctl set balanced
        ;;
    "power-saver")
        powerprofilesctl set power-saver
        ;;
    *)
        exit 1
        ;;
esac

# setting refresh rate based on power profile, meh

# new_profile=$(powerprofilesctl get)

# # Set refresh rate based on profile
# if [ "$profile" = "power-saver" ]; then
#     internal_display="eDP-1"

#     swaymsg output $internal_display mode 2880x1800@60Hz 

#     notify-send "Set to $profile mode with 60Hz refresh rate" -i "battery"
# else
#     internal_display="eDP-1"

#     swaymsg output $internal_display mode 2880x1800@120Hz

#     notify-send "Power Profile" "Set to $profile mode with 120Hz refresh rate" -i "battery"
# fi

