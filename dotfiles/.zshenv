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

# bun things
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.cargo/env"

