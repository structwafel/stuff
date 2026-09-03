#!/usr/bin/env bash
# clipboard-annotate.sh — annotate any image from clipboard history, after the fact.
#
# Fills the gap between cliphist (has the screenshots) and satty (can annotate
# them): pick an old image out of history and reopen it in satty. satty accepts
# `-f <file>`, not just stdin, so no new tooling is needed for this.
#
# On save/escape satty routes through satty-copy, which forces image/png -- the
# same reason that wrapper exists for fresh captures.
set -euo pipefail

images=$(cliphist list | grep 'binary data') || exit 0
[ -n "$images" ] || { notify-send "clipboard" "no images in history" 2>/dev/null; exit 0; }

sel=$(printf '%s\n' "$images" | wofi --dmenu --conf /dev/null --insensitive --prompt annotate) || exit 0
[ -n "$sel" ] || exit 0

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT
img="$tmpdir/clip.png"

printf '%s' "$sel" | cliphist decode > "$img" || exit 0
[ -s "$img" ] || exit 0

case "$(file --mime-type -b "$img")" in
    image/*) ;;
    *) exit 0 ;;
esac

satty -f "$img" \
    --initial-tool=arrow \
    --copy-command=/home/lgx/.local/bin/satty-copy \
    --actions-on-escape="save-to-clipboard,exit" \
    --brush-smooth-history-size=5 \
    --disable-notifications \
    --fullscreen
