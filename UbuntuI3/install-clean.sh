#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as errors

#------------------------------
# 1. Update System
#------------------------------
echo "Updating package lists..."
sudo apt update

#------------------------------
# 2. Add Kitware Repository (for CMake)
#------------------------------
KITWARE_KEYRING=/usr/share/keyrings/kitware-archive-keyring.gpg
KITWARE_LIST=/etc/apt/sources.list.d/kitware.list

if [ ! -f "$KITWARE_KEYRING" ]; then
    echo "Adding Kitware repository..."
    wget -O - https://apt.kitware.com/keys/kitware.gpg | sudo gpg --dearmor -o "$KITWARE_KEYRING"
    echo "deb [signed-by=$KITWARE_KEYRING] https://apt.kitware.com/ubuntu/ jammy main" | sudo tee "$KITWARE_LIST"
    sudo apt update
fi

#------------------------------
# 3. Essential Packages
#------------------------------
echo "Installing essential packages..."
sudo apt install -y \
    build-essential python3-dev \
    openjdk-17-jdk \
    rofi i3blocks feh arandr \
    fonts-noto-color-emoji fonts-font-awesome \
    brightnessctl \
    vim-gtk \
    cmake \
    tmux \
    tlp tlp-rdw

#------------------------------
# 4. Go (latest version)
#------------------------------
GO_VERSION="1.22.4"
GO_ARCHIVE="go${GO_VERSION}.linux-amd64.tar.gz"
if ! go version 2>/dev/null | grep -q "$GO_VERSION"; then
    echo "Installing Go $GO_VERSION..."
    wget -q "https://go.dev/dl/${GO_ARCHIVE}"
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf "$GO_ARCHIVE"
    rm "$GO_ARCHIVE"
    if ! grep -q "/usr/local/go/bin" "$HOME/.bashrc"; then
        echo 'export PATH="$PATH:/usr/local/go/bin"' >> "$HOME/.bashrc"
    fi
    export PATH="$PATH:/usr/local/go/bin"
fi

#------------------------------
# 5. Neovim (latest AppImage)
#------------------------------
echo "Installing latest Neovim AppImage..."
sudo wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -O /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim

#------------------------------
# 6. Tmux Plugin Manager
#------------------------------
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Ensure tmux config includes plugin lines
grep -qxF "set -g @plugin 'tmux-plugins/tpm'" "$HOME/.tmux.conf" 2>/dev/null || echo "set -g @plugin 'tmux-plugins/tpm'" >> "$HOME/.tmux.conf"
grep -qxF "set -g @plugin 'tmux-plugins/tmux-sensible'" "$HOME/.tmux.conf" 2>/dev/null || echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> "$HOME/.tmux.conf"
grep -qxF "run '~/.tmux/plugins/tpm/tpm'" "$HOME/.tmux.conf" 2>/dev/null || echo "run '~/.tmux/plugins/tpm/tpm'" >> "$HOME/.tmux.conf"

#------------------------------
# 7. Copy Config Files
#------------------------------
echo "Copying configuration files..."

# Vim config
cp -v ./home/.vimrc "$HOME/"
cp -v ./home/.dir_colors "$HOME/"
cp -v ./home/.Xresources "$HOME/"
cp -v ./home/.bashrc "$HOME/"

# i3, i3blocks, rofi, nvim configs
mkdir -p "$HOME/.config/i3" "$HOME/.config/i3blocks" "$HOME/.config/rofi" "$HOME/.config/nvim"
cp -vr ./config/i3/* "$HOME/.config/i3/"
cp -vr ./config/i3blocks/* "$HOME/.config/i3blocks/"
cp -vr ./config/rofi/* "$HOME/.config/rofi/"
cp -vr ./config/nvim/* "$HOME/.config/nvim/"

# Applications folder
mkdir -p "$HOME/Applications"

#------------------------------
# 8. Permissions & Post-Install
#------------------------------
# Make power-menu script executable
chmod +x "$HOME/.config/i3/power-menu.sh"

# Allow brightnessctl to run as root
sudo chmod +s "$(which brightnessctl)"

#------------------------------
# 9. YouCompleteMe Plugin Build (Vim)
#------------------------------
if [ -d "$HOME/.vim/plugged/YouCompleteMe" ]; then
    echo "Building YouCompleteMe plugin..."
    cd "$HOME/.vim/plugged/YouCompleteMe"
    python3 install.py --all
fi

echo "Setup complete! Please restart your terminal or run 'source ~/.bashrc' to update your PATH."

