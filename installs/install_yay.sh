#!/bin/bash

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Enable colors + niceties in pacman/yay output
sudo sed -i 's/^#Color$/Color/; s/^#VerbosePkgLists$/VerbosePkgLists/; /^Color$/a ILoveCandy' /etc/pacman.conf