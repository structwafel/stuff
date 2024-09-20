#!/bin/bash

# Update package list and install Git
sudo pacman -Syu
sudo pacman -S git

# Clone the repository
git clone https://github.com/structwafel/stuff.git

# Change to the repository directory
cd stuff

# Run the install script
./just_user_things.sh