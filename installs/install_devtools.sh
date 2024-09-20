#!/bin/bash

# install dev things

# install go
yay -S go

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

