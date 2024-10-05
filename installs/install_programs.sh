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
    "flameshot" 
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
    "lazygit"
    "lazydocker"
    "nextcloud-client"
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
)



for program in "${programs[@]}"; do
    if ! pacman -Q $program &> /dev/null; then
        echo "Installing $program"
        yay -S --noconfirm $program
    else
        echo "$program already installed"
    fi
done