#!/bin/bash

umask 111

# List of apps to install with yay
apps_to_install=(
  google-chrome
  visual-studio-code-bin
  vscodium-bin
)

# Install apps using yay
for app in "${apps_to_install[@]}"; do
  yay -S --noconfirm "$app"
done

# Clone the Plymouth theme repository and set it as default
git clone https://github.com/l1nux-th1ngz/arch.git
cd arch
chmod +x setup-plymouth.sh
./setup-plymouth.sh

# List of commands to run
commands=(
  ranger
  alacritty
  kitty
  plymouth
  fish
  bluefish
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  dolphin
  dolphin-plugins
)

# Loop through the commands and execute them
for command in "${commands[@]}"; do
  "$command" &
done
