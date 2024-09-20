#!/bin/bash

# Need this in visudo:
# lgx ALL=(ALL) NOPASSWD: /home/lgx/go/bin/gbmonctl


# Define file to store the current brightness level
BRIGHTNESS_FILE="$HOME/.current_brightness"
DEFAULT_BRIGHTNESS=100 # Default to 50 if no file exists
STEP=10 # Adjust step size

# Check if the brightness file exists, if not create it with default brightness
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    echo $DEFAULT_BRIGHTNESS > "$BRIGHTNESS_FILE"
fi

# Read the current brightness
current_brightness=$(cat "$BRIGHTNESS_FILE")

# Calculate new brightness based on the argument (+10 or -10)
if [ "$1" == "up" ]; then
    new_brightness=$((current_brightness + STEP))
elif [ "$1" == "down" ]; then
    new_brightness=$((current_brightness - STEP))
fi

# Limit the brightness values to between 0 and 100
if [ $new_brightness -gt 100 ]; then
    new_brightness=100
elif [ $new_brightness -lt 0 ]; then
    new_brightness=0
fi

# Set the new brightness using gbmonctl
sudo ~/go/bin/gbmonctl -prop brightness -val $new_brightness
# sudo /home/lgx/.config/sway/set-brightness.sh $new_brightness
# Update the brightness file
echo $new_brightness > "$BRIGHTNESS_FILE"
