export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export ELECTRON_OZONE_PLATFORM_HINT=wayland


#add .local/bin to path
export PATH=$HOME/.local/bin:$PATH

# add atuin to local path
export PATH=$HOME/.atuin/bin:$PATH

# rust things
export PATH=$HOME/.cargo/bin:$PATH

# go things
export PATH=$PATH:$HOME/go/bin

. "$HOME/.cargo/env"


# Set different environment variables based on the hostname
if [ "$(uname -n)" = "lniclerk" ]; then
    export SCRATCHPAD_HEIGHT=600
    export SCRATCHPAD_WIDTH=800
elif [ "$(uname -n)" = "desktop-hostname" ]; then
    export SCRATCHPAD_HEIGHT=1200
    export SCRATCHPAD_WIDTH=1000
fi