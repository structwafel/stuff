#!/bin/bash

hostname=$(cat /etc/hostname)

# Clear any existing generated config
rm -f ~/.config/sway/generated-extra-config

# Get hostname
HOSTNAME=$(cat /etc/hostname)

# Link the appropriate configuration based on hostname
if [[ "$HOSTNAME" == "archlinuxpro9" ]]; then
    # Laptop configuration
    ln -sf ~/.config/sway/config.d/yogapro ~/.config/sway/generated-extra-config
elif [[ "$HOSTNAME" == "archswayhome" ]]; then
    # Desktop configuration
    ln -sf ~/.config/sway/config.d/desktop ~/.config/sway/generated-extra-config
fi