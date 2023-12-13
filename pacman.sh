#!/bin/bash

# Specify the path to your pacman.conf file
pacman_conf="/etc/pacman.conf"

# Backup the original pacman.conf file
cp "$pacman_conf" "$pacman_conf.bak"

# Uncomment and modify specific lines in pacman.conf
sed -i 's/^#Color/Color/' "$pacman_conf"
sed -i 's/^#ILoveCandy/ILoveCandy/' "$pacman_conf"
sed -i 's/^#CheckSpace/CheckSpace/' "$pacman_conf"
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 15/' "$pacman_conf"
sed -i 's/^#SigLevel/SigLevel/' "$pacman_conf"
sed -i 's/^#LocalFileSigLevel = Optional/LocalFileSigLevel = Optional/' "$pacman_conf"

# You can add more customizations as needed

echo "Customization of $pacman_conf completed. Backup saved as $pacman_conf.bak"
