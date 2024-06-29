#!/bin/bash

# Update and Upgrade
echo "Updating and upgrading your system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y fonts-font-awesome exa micro neovim tree fastfetch git dunst

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y sway waybar swaylock wofi htop foot neofetch

# Create necessary directories
echo "Creating configuration directories..."
mkdir -p $HOME/.config/{sway,waybar,swaylock,wofi,foot,htop,neofetch}

# Copy configuration files
echo "Copying configuration files..."
cp -r .config/sway/* $HOME/.config/sway/
cp -r .config/waybar/* $HOME/.config/waybar/
cp -r .config/swaylock/* $HOME/.config/swaylock/
cp -r .config/wofi/* $HOME/.config/wofi/
cp -r .config/foot/* $HOME/.config/foot/
cp -r .config/htop/* $HOME/.config/htop/
cp -r .config/neofetch/* $HOME/.config/neofetch/

# Copy home directory files
echo "Copying home directory files..."
cp home/.tmux.conf $HOME/
mkdir -p $HOME/.tmux
cp home/.tmux/* $HOME/.tmux/
cp home/.bashrc $HOME/

echo "Installation complete. Please reboot."
