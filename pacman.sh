#!/bin/bash

pacman_conf="/etc/pacman.conf"

sed -i 's/^#Color/Color/' "$pacman_conf"
sed -i 's/^#ILoveCandy/ILoveCandy/' "$pacman_conf"
sed -i 's/^#CheckSpace/CheckSpace/' "$pacman_conf"
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 15/' "$pacman_conf"
sed -i 's/^#SigLevel/SigLevel/' "$pacman_conf"
sed -i 's/^#LocalFileSigLevel = Optional/LocalFileSigLevel = Optional/' "$pacman_conf"

# You can add more customizations as needed

echo "Customization of $pacman_conf completed."
