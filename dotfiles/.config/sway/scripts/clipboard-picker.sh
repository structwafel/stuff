#!/usr/bin/env bash
# clipboard-picker.sh — cliphist picker for $mod+c.
#
# Fixes two things the naive `cliphist list | wofi --dmenu | cliphist decode |
# wl-copy` pipeline gets wrong:
#
#   1. Cancelling the picker used to WIPE the clipboard. wofi exits with no
#      output, cliphist decode fails, but wl-copy still ran and set an empty
#      text/plain selection, destroying whatever was held.
#   2. Images came back as text/plain. wl-copy reading from stdin has nothing
#      to infer a MIME type from, so image-aware consumers (herdr, Claude Code,
#      browsers) saw no image.
set -euo pipefail

# Listed separately from the picker: under `pipefail`, a picker that exits
# without draining stdin gives cliphist a SIGPIPE and fails the whole pipeline.
list=$(cliphist list) || exit 0
[ -n "$list" ] || exit 0

sel=$(printf '%s\n' "$list" | wofi --dmenu --conf /dev/null --insensitive --prompt clipboard) || exit 0
[ -n "$sel" ] || exit 0

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

printf '%s' "$sel" | cliphist decode > "$tmp" || exit 0
[ -s "$tmp" ] || exit 0

mime=$(file --mime-type -b "$tmp")
case "$mime" in
    image/*) wl-copy --type "$mime" < "$tmp" ;;
    *)       wl-copy < "$tmp" ;;
esac
