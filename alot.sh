#!/bin/bash

# onlt this with sud
sudo pacman -S xdg-user-dirs 
xdg-user-dirs-update
sudo pacman -S xdg-user-dirs-gtk
xdg-user-dirs-update

# lets goooooooooo
pacman -S --noconfirm git base-devel multilib-devel go 


# Install Rustup
pacman -S --noconfirm rustup

# Sleep until Rustup installation completes
while ! command -v rustup &> /dev/null; do
    sleep 1
done

# Set Rust version to stable without prompting the user
rustup default stable || { echo "Failed to set default Rust version"; sleep 8; }

# Chroot into the temporary directory
arch-chroot /path/to/chroot/directory /bin/bash <<EOF

# Check but do not exit this script ever
git clone https://aur.archlinux.org/aurutils.git && cd aurutils && makepkg -si 
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install these with yay
packages=(
    "autoconf"
    "autoconf-archive"
    "automake"
    "starship"
    "wlroots"
    "wayland"
    "wayland-utils"
    "wayland-protocols"
    "gdb"
    "ninja"
    "gcc"
    "cmake"
    "meson"
    "libxcb"
    "xcb-proto"
    "xcb-util"
    "xcb-util-keysyms"
    "libxfixes"
    "libx11"
    "libxcomposite"
    "xorg-xinput"
    "libxrender"
    "pixman"
    "cairo"
    "pango"
    "seatd"
    "libxkbcommon"
    "xcb-util-wm"
    "xorg-xwayland"
    "libinput"
    "libliftoff"
    "libdisplay-info"
    "cpio"
    "npm"
    "jo"
    "jq"
    "tomlplusplus"
    "clang"
    "gcc"
    "qt5-wayland"
    "qt6-wayland"
    "xdg-desktop-portal"
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-wlr"
    "nodejs"
    "xdg-desktop-portal-hyprland"
    "pipewire"
    "wireplumber"
    "dunst"
    "python"
    "python-pywal"
    "strawberry"
    "brightnessctl"
    "bluez"
    "bluez-libs"
    "rofi-lbonn-wayland-git"
    "networkmanager"
    "network-manager-applet"
    "wofi"
    "qt5-gsettings"
    "ffmpegthumbs"
    "playerctl"
    "lightly-qt"
    "kvantum"
    "polkit-kde-agent"
    "ttf-font-awesome-5"
    "jq"
    "gufw"
    "qt5ct"
    "tar"
    "gammastep"
    "wl-clipboard"
    "nwg-look-bin"
    "thunderbird"
    "visual-studio-code-bin"
    "firefox"
    "easyeffects"
    "mako"
    "hyprpicker"
    "hyprshot-git"
    "bc"
    "sysstat"
    "gtk-layer-shell"
    "kitty"
    "alacritty"
    "sassc"
    "zip"
    "unzip"
    "systemsettings"
    "ttf-font-awesome-5"
    "orchis-theme-git"
    "acpi"
    "fish"
    "nwg-look"
    "blueman"
    "lightly-qt"
    "firefox"
    "mpc"
    "mpd"
    "vlc"
    "mpv"
    "celluloid"
    "geany"
    "geany-plugins"
    "notepadqq"
    "nm-connection-editor"
    "glib2"
    "gtk3"
    "dea# Prompt user to choose default rustup version
echo "Choose default Rust version using 'rustup default <version>' (e.g., stable, nightly)"
read -t 8 -p "Enter Rust version (timeout in 8 seconds): " rust_version
rustup default "$rust_version" || { echo "Failed to set default Rust version"; sleep 8; }dd-notification-center-bin"
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
    "eww-wayland"
    "zenity"
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
    
    "pacman-contrib"
    "reflector"
    "python-pip"
    "python-pipx"
    "tk"
    "python-connect"
    "python-pyaml"
    "python-click"
    "yad"
    "aconfmgr-git"
    "xdg-base-dir-env"
    "xdg-su"
    "sudo"
    "xdg-environment"
    "gtk4-layer-shell"
)

# Install other essential packages with the chosen AUR helper
for package in "${packages[@]}"; do
    yay -S --noconfirm "$package" || { echo "Failed to install $package"; exit 1; }
done

# Start paccache.timer
systemctl --user enable paccache.timer

# Clone git repo
git clone https://github.com/l1nux-th1ngz/colors.git

# Pause for user
read -t 8 -p "Waiting for user input..."

# add deadd make cava mpd geany eww to .config
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
