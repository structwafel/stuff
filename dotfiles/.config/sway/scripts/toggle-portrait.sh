#!/bin/sh
# toggle-portrait.sh -- rotate the focused output between landscape and portrait.
# Handy for finding out whether it is vertical pixels you actually miss.
set -eu

read -r name transform <<END
$(swaymsg -t get_outputs | jq -r '.[] | select(.focused == true) | "\(.name) \(.transform)"')
END

case "$transform" in
    normal) swaymsg output "$name" transform 90 ;;
    *)      swaymsg output "$name" transform normal ;;
esac
