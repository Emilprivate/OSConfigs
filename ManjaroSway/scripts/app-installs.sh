#!/bin/bash

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install Vim
echo "Installing Vim..."
sudo pacman -S vim --noconfirm

# Install Zsh
echo "Installing Zsh..."
sudo pacman -S zsh --noconfirm

# Set Zsh as default shell
echo "Setting Zsh as default shell..."
chsh -s $(which zsh)

# Install Kanshi (Dynamic display configuration for Sway)
echo "Installing Kanshi..."
sudo pacman -S kanshi --noconfirm

# Install Neofetch (System info tool)
echo "Installing Neofetch..."
sudo pacman -S neofetch --noconfirm

# Install Tmux
echo "Installing Tmux..."
sudo pacman -S tmux --noconfirm

# Install Yarn
echo "Installing Yarn..."
sudo pacman -S yarn --noconfirm

# Install nodejs
sudo pacman -S nodejs --noconfirm

# Install unzip
sudo pacman -S unzip --noconfirm

# Install fzf
sudo pacman -S fzf --noconfirm

sudo pacman -S jdk17-openjdk

sudo pacman -S base-devel cmake python3 go npm --noconfirm

echo "Application installation complete!"
