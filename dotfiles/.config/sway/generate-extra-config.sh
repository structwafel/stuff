#!/bin/bash

# Get hostname
HOSTNAME=$(cat /etc/hostname)

# Clear any existing generated config
rm -f ~/.config/sway/generated-extra-config

# Create the appropriate configuration based on hostname
if [[ "$HOSTNAME" == "archlinuxpro9" ]]; then
    # Laptop configuration - copy content
    cat ~/stuff/dotfiles/.config/sway/config.d/yogapro > ~/.config/sway/generated-extra-config
elif [[ "$HOSTNAME" == "archswayhome" ]]; then
    # Desktop configuration - copy content
    cat ~/stuff/dotfiles/.config/sway/config.d/desktop > ~/.config/sway/generated-extra-config
elif [[ "$HOSTNAME" == "ubuntumtime" ]]; then
    # Work laptop (ThinkPad L14) configuration
    cat ~/stuff/dotfiles/.config/sway/config.d/ubuntumtime > ~/.config/sway/generated-extra-config
fi