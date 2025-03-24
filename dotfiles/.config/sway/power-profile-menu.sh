#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Create menu options with the current one marked
options=""
if [ "$current" = "performance" ]; then
    options+=" Performance (active)\n"
else
    options+=" Performance\n"
fi

if [ "$current" = "balanced" ]; then
    options+=" Balanced (active)\n"
else
    options+=" Balanced\n"
fi

if [ "$current" = "power-saver" ]; then
    options+=" Power-saver (active)\n"
else
    options+=" Power-saver\n"
fi

# Show menu and get selection using fuzzel like the power menu
selected=$(echo -e "$options" | fuzzel -i --dmenu | awk '{print tolower($2)}')

# Apply selected profile if one was chosen
if [ -n "$selected" ]; then
    # Remove "(active)" if present in the selection
    profile=$(echo "$selected" | sed 's/ (active)//g')
    powerprofilesctl set "$profile"
    notify-send "Power Profile" "Set to $profile mode" -i "battery"
fi