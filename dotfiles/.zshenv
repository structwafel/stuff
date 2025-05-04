export SDL_VIDEODRIVER=wayland,x11
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# idk pam/sway/ly/systemd enviroment variables/ everything doesn't work as expected.
# so setting this manually 
export SSH_AUTH_SOCK=/run/user/1000/gcr/ssh

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

# android things
# export JAVA_HOME=/opt/android-studio/jbr
# export ANDROID_HOME="$HOME/Android/Sdk"
# export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk | sort -V | tail -n 1)"
# export PATH="$PATH:$ANDROID_HOME/emulator"

# flutter things
export PATH="$PATH:$HOME/flutter/flutter/bin"

# nix things
export PATH="$PATH:$HOME/.nix-profile/bin"

export PATH="$PATH:$HOME/.cargo/env"

