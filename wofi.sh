# Install
mkdir -p ~/.config/wofi/wofi-shortcuts/
mkdir -p ~/.local/share/wofi/wofi-shortcuts/
cp ./wofi-shortcuts.conf ~/.config/wofi/wofi-shortcuts/wofi-shortcuts.conf
cp ./wofi-shortcuts.sh ~/.local/share/wofi/wofi-shortcuts/wofi-shortcuts.sh
chmod u+x ~/.local/share/wofi/wofi-shortcuts/wofi-shortcuts.sh
ln -sf ~/.local/share/wofi/wofi-shortcuts/wofi-shortcuts.sh ~/.local/bin/wofi-shortcuts

# Then run wofi-shortcuts
wofi-shortcuts
