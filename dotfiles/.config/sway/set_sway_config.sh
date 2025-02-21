#!/bin/bash

hostname=$(cat /etc/hostname)

if [ "$hostname" = "xpslaptop" ]; then
    cat <<EOF > ~/.config/sway/generated_config
exec_always "youtube-music"
for_window [app_id="com.github.th_ch.youtube_music"] move scratchpad
bindsym \$mod+m [app_id="com.github.th_ch.youtube_music"] scratchpad show, resize set width 1600 height 800, move position center

exec_always "signal-desktop"
for_window [app_id="signal"] move scratchpad
bindsym \$mod+r [app_id="signal"] scratchpad show, resize set width 1600 height 800, move position center

exec_always "kitty --class mykitty ~/"
for_window [app_id="mykitty"] move scratchpad
bindsym \$mod+l [app_id="mykitty"] scratchpad show, resize set width 1600 height 800, move position center
EOF
elif [ "$hostname" = "archswayhome" ]; then
    cat <<EOF > ~/.config/sway/generated_config
exec_always "youtube-music"
for_window [app_id="com.github.th_ch.youtube_music"] move scratchpad
bindsym \$mod+m [app_id="com.github.th_ch.youtube_music"] scratchpad show, resize set width 1920 height 1080, move position center

exec_always "signal-desktop"
for_window [app_id="signal"] move scratchpad
bindsym \$mod+r [app_id="signal"] scratchpad show, resize set width 1920 height 1080, move position center

exec_always "kitty --class mykitty ~/"
for_window [app_id="mykitty"] move scratchpad
bindsym \$mod+l [app_id="mykitty"] scratchpad show, resize set width 1920 height 1080, move position center
EOF
fi