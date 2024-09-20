#!/bin/bash

./installs/install_server_things.sh

stow dotfiles --adopt

chsh -s $(which zsh)