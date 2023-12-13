# Install Rustup
pacman -S --noconfirm rustup

# Sleep until Rustup installation completes
while ! command -v rustup &> /dev/null; do
    sleep 1
done

# Set Rust version to stable without prompting the user
rustup default stable || { echo "Failed to set default Rust version"; sleep 8; }

# Auto continue and set execute permissions for the next script
echo "Continuing to the next script..."
chmod +x 2.sh
./2.sh
