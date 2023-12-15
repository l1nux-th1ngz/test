#!/bin/bash

# Format and mount the NVMe drives
mkfs.ext4 /dev/nvme0n1
mount /dev/nvme0n1 /mnt/home

mkfs.ext4 /dev/nvme1n1
mount /dev/nvme1n1 /mnt

# Install Arch Linux with 64-bit EFI
pacstrap /mnt base linux linux-firmware

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt

# Install required packages
pacman -S --noconfirm gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus plymouth sddm kitty alacritty firefox go chromium git xdg-user-dirs xdg-user-dirs-gtk

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

# Set up initial RAM disk
mkinitcpio -P

# Set the time zone
ln -sf /usr/share/zoneinfo/Your_Timezone /etc/localtime
hwclock --systohc

# Uncomment desired locales in /etc/locale.gen and generate them
# echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

# Set the hostname
echo "Your_Hostname" > /etc/hostname

# Set the root password
passwd

# Install and configure bootloader (assuming you want GRUB)
pacman -S --noconfirm grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Exit chroot and unmount partitions
exit
umount -R /mnt

# Reboot into the installed system
reboot
