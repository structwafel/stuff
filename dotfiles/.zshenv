export SDL_VIDEODRIVER=wayland,x11
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# idk pam/sway/ly/systemd enviroment variables/ everything doesn't work as expected.
# so setting this manually 
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# /etc/locale.conf only reaches login shells (/etc/profile.d/locale.sh) and
# systemd units, and herdr panes are neither — tailscale ssh doesn't use pam
# either, so /etc/environment can't fill the gap. Without this btop refuses to
# start ("No UTF-8 locale detected!") because the locale falls back to C.
export LANG=en_GB.UTF-8

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

export PATH="$PATH:$HOME/.cargo/bin"

# Disable pagers — keeps agentic tools (Claude Code, GitHub Copilot, etc.)
# from hanging on `gh pr view`, `git log`, `systemctl status`, `man`, etc.
export PAGER=cat
export GIT_PAGER=cat
export GH_PAGER=cat
export SYSTEMD_PAGER=cat
