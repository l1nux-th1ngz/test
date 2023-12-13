#!/bin/bash

# DO NOT RUN THIS AS ROOT IT WILL CAUSE CRITICAL DAMAGE TO YOUR SYSTEM

# Check but do not exit this script ever
git clone https://aur.archlinux.org/aurutils.git && cd aurutils && makepkg -si 
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Sleep until all three of the above packages have finished installing
while [[ ! -x "$(command -v aur)" || ! -x "$(command -v paru)" || ! -x "$(command -v yay)" ]]; do
    sleep 1
done

# Install these with yay
packages=(
    "aalib"
    "jp2a"
    "ascii"
    "i2pd"
    "lsd"
    "thefuck"
    "archinstall"
    "shell-color-scripts"
    "udisks2"
    "udiskie"
    "pavucontrol"
    "gjs"
    "go-object-introspection"
    "libpuls"
    "typescript"
    "npm"

    # aylurs-gtk-shell and additional packages
    "eww-wayland"
    "zenity"
    "dead-notification-center-bin"
    "cava"
    "thunar"
    "ffmpeg"
    "thunar-volman"
    "thunar-archive-plugin"
    "gvfs"
    "ranger"
    "swww"
    "cliphist"
    "copyq"
    "spotify"
    "spotify-adblock-git"
    "spotify-wayland"
    "tumbler"
    "hyprland-git"
    "aylurs-gtk-shell"
)


# Install other essential packages with the chosen AUR helper
for package in "${packages[@]}"; do
    echo "Installing $package..."
    yay -S --noconfirm "$package" || { echo "Failed to install $package"; exit 1; }
done

# Start paccache.timer
systemctl --user enable paccache.timer

# Clone git repo
git clone https://github.com/l1nux-th1ngz/colors.git

# Pause for user
read -t 8 -p "Waiting for user input..."

# Add deadd, make, cava, mpd, geany, eww to .config
# Copy files
cp ~/.config/fish/config.fish ~/.config/fish/config.back.fish
cp -r my-hyprland-config ~/.config/hypr
cp -r ~/.config/hypr/configs/ags ~/.config/ags
cp -r ~/.config/hypr/configs/wofi ~/.config/wofi
cp ~/.config/hypr/configs/config.fish ~/.config/fish/config.fish

# Set permissions for scripts
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.config/ags/scripts/*

# Setup environment
cp /etc/environment /etc/environmentOLD
echo 'QT_QPA_PLATFORMTHEME=qt5ct' | tee -a /etc/environment

# Copy theme files
mkdir -p ~/.local/share/color-schemes/
cp ~/.config/ags/modules/theme/plasma-colors/* ~/.local/share/color-schemes/
cp ~/.config/hypr/configs/qt5ct.conf ~/.config/qt5ct/

mkdir -p ~/.fonts
cp -r ~/.config/hypr/configs/.fonts/* ~/.fonts

mkdir -p ~/.local/share/icons
tar xvf ~/.config/hypr/configs/icons/*.tar.gz -C ~/.local/share/icons

mkdir -p ~/.themes
tar xvf ~/.config/hypr/configs/gtk-themes/*.tar.gz -C ~/.themes

# Install plymouth
yay -S --noconfirm plymouth-theme-sweet-arch-git

# Enable plymouth
plymouth-set-default-theme -R sweet-arch

# Clone, install, and enable sddm
git clone https://github.com/stuomas/delicious-sddm-theme.git && cd delicious-sddm-theme && chmod +x ./install.sh

# Enable sddm
systemctl enable sddm

# Update Arch
sudo pacman -Syu --noconfirm

# Notify user to manually reboot
echo "Installation complete. Please manually reboot your system."
