#!/bin/bash

# Need this in visudo:
# lgx ALL=(ALL) NOPASSWD: /home/lgx/go/bin/gbmonctl


# Define file to store the current brightness level (in percent)
BRIGHTNESS_FILE="$HOME/.current_brightness"
DEFAULT_BRIGHTNESS=100 # Default to 100% if no file exists
STEP=10 # Default step size (in percent)
MIN_BRIGHTNESS=1 # Minimum brightness (1% instead of 0%)

# Check if the brightness file exists, if not create it with default brightness
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    echo $DEFAULT_BRIGHTNESS > "$BRIGHTNESS_FILE"
fi

# Read the current brightness
current_brightness=$(cat "$BRIGHTNESS_FILE")

# Determine step size based on current brightness
# Use smaller steps at lower brightness levels
if [ $current_brightness -le 10 ]; then
    step_size=1
elif [ $current_brightness -le 30 ]; then
    step_size=5
else
    step_size=$STEP
fi

# Calculate new brightness based on the argument
if [ "$1" == "up" ]; then
    new_brightness=$((current_brightness + step_size))
elif [ "$1" == "down" ]; then
    new_brightness=$((current_brightness - step_size))
fi

# Limit the brightness values to between MIN_BRIGHTNESS and 100
if [ $new_brightness -gt 100 ]; then
    new_brightness=100
elif [ $new_brightness -lt $MIN_BRIGHTNESS ]; then
    new_brightness=$MIN_BRIGHTNESS
fi

name=$(uname -n)

# brightnessctl doesn't work on dumb monitors
if [ "$name" = "archswayhome" ]; then
    # brightness $new_brightness
    # Set the new brightness using gbmonctl
    sudo ~/go/bin/gbmonctl -prop brightness -val "$new_brightness"
    # sudo /home/lgx/.config/sway/set-brightness.sh "$new_brightness"
    # Update the brightness file
else
    brightnessctl s "${new_brightness}%"
fi

echo "$new_brightness" > "$BRIGHTNESS_FILE"
