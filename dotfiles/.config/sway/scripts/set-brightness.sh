#!/bin/bash
# Wrapper script to adjust monitor brightness using gbmonctl

# Needs this in visudo:
# lgx ALL=(ALL) NOPASSWD: /home/lgx/.config/sway/set-brightness.sh

# Example usage of gbmonctl with sudo inside the script
sudo /home/lgx/go/bin/gbmonctl -prop brightness -val "$1"
