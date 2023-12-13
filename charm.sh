#!/bin/bash

# Define the apps
apps=("charmsh-mods" "charmsh-pop" "charmsh-wishlist" "charmsh-vhs" "charmsh-softserve" "charmsh-glow" "charmsh-skate")

# Create a dialog with Yad
selected_app=$(yad --title "Charm.sh Apps Installer" --width 300 --height 300 --list --column "Apps" "${apps[@]}" --button="Install:0" --button="Cancel:1")

# Check if the user clicked Cancel
if [[ $? -eq 1 ]]; then
    exit 0
fi

# Extract the selected app
selected_app=$(echo "$selected_app" | awk -F "|" '{print $1}')

# Install the selected app
echo "Installing $selected_app..."
yay -S $selected_app
