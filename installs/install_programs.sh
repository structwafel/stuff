#!/bin/bash

programs=(
  "git"
  "stow"
  "zsh"
  "eza"
  "micro"
  "fzf"
  "tree"
  "kitty"
  "wofi"
  "bat"
  "visual-studio-code-bin"
  "nautilus"
  "nautilus-image-converter"
  "nautilus-share"
  "fastfetch"
  "ferrishot-bin" # screenshot tool
  "kooha" # excellent simple recording
  # stuff for flameshot
  "xdg-desktop-portal"
  "xdg-desktop-portal-gnome"
  "xdg-desktop-portal-wlr"
  "grim"
  "slurp"
  "fuzzel"
  "gdu" 
  "github-cli"
  "btop"
  # "lazygit"
  # "lazydocker"
  # "nextcloud-client"
  "pavucontrol"
  "polkit-gnome"
  "polkit"
  "mako"
  "sway-audio-idle-inhibit-git"
  "ripgrep"
  "tokei"
  "tree"
  "wofi-emoji"
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-autopair-git"
  "zsh-fast-syntax-highlighting"
  "atuin"
  "starship"
  "zoxide"
  "less"
  "cliphist"
  "swaylock-effects"
  "blueman"
  "bluez"
  "bluez-utils"
  "network-manager-applet"
  # editor
  "helix"
  "taplo-cli"
  "rust-analyzer"
)

# filter out installed programs
to_install=()
for program in "${programs[@]}"; do
  if ! pacman -Q $program &>/dev/null; then
    to_install+=("$program")
  else
    echo "$program already installed"
  fi
done

# install programs
if [ ${#to_install[@]} -gt 0 ]; then
  echo "Installing ${#to_install[@]} packages..."
  yay -S --noconfirm "${to_install[@]}"
fi
