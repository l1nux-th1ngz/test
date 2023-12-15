#!/bin/bash

# Install yay
pacman -Sy --noconfirm yay

# Install required packages using yay
yay -S --noconfirm \
  gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite \
  xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland \
  libinput libliftoff libdisplay-info cpio tomlplusplus plymouth sddm \
  firefox cava hayprland-git rofi-lbonn-wayland visual-studio-code-bin xdg-user-dirs xdg-user-dirs-gtk \
  kitty alacritty wezterm

# Enable necessary services
systemctl enable sddm.service
systemctl enable plymouth.service

# Clone and install sddm-theme
git clone https://github.com/stuomas/delicious-sddm-theme.git
cd delicious-sddm-theme
./install.sh
cd ..

# Clone and install plymouth theme
git clone https://aur.archlinux.org/plymouth-theme-arch10.git
cd plymouth-theme-arch10
makepkg -si
cd ..
