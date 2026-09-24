#!/usr/bin/env bash
# flameshot-window.sh — open flameshot with the focused window preselected.
#
# `flameshot gui --region` is not in sway's global layout coordinates: v14
# applies it to the one monitor being captured, in physical pixels (it divides
# by the device pixel ratio itself). So the window rect is shifted by its
# output's origin and multiplied by that output's scale first.
set -euo pipefail

region=$(swaymsg -t get_tree | jq -r '
    .nodes[] | select(.type == "output") | . as $o
    | first(.. | select(.focused? == true)) | .rect as $w
    | ($o.scale // 1) as $s
    | "\(($w.width * $s) | round)x\(($w.height * $s) | round)+\((($w.x - $o.rect.x) * $s) | round)+\((($w.y - $o.rect.y) * $s) | round)"')

exec flameshot gui --clipboard ${region:+--region "$region"}
