#!/bin/bash

./installs/install_yay.sh
./installs/install_devtools.sh
./installs/install_programs.sh

stow dotfiles --adopt

chsh -s $(which zsh)


# start bluetooth service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service