#!/bin/sh

LAPTOP_OUTPUT="eDP-1"

outputs_json=$(swaymsg -t get_outputs)
output_count=$(echo "$outputs_json" | grep -c '"name":')

# check if laptop output is active using python/jq-style parsing
is_active=$(echo "$outputs_json" | python3 -c "
import sys, json
for o in json.load(sys.stdin):
    if o['name'] == '$LAPTOP_OUTPUT':
        print(1 if o['active'] else 0)
        break
else:
    print(0)
")

echo "outputs: $output_count, eDP-1 active: $is_active"

if [ "$is_active" -eq 1 ]; then
    if [ "$output_count" -gt 1 ]; then
        echo "disabling $LAPTOP_OUTPUT"
        swaymsg output "$LAPTOP_OUTPUT" disable
    else
        echo "not disabling: $LAPTOP_OUTPUT is the only display"
    fi
else
    echo "enabling $LAPTOP_OUTPUT"
    swaymsg output "$LAPTOP_OUTPUT" enable
fi
