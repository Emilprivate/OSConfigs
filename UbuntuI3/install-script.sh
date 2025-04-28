# This is my install script for my config files.

sudo apt update

# Install rofi
sudo apt install rofi -y

# Install i3blocks
sudo apt install i3blocks -y

# Install emoji & icon fonts
sudo apt install fonts-noto-color-emoji fonts-font-awesome -y

# Install feh
sudo apt install feh -y

# Install arandr
sudo apt install arandr -y

# Install brightnessctl
sudo apt-get install brightnessctl -y

# Make power‑menu script executable
chmod +x $HOME/.config/i3/power-menu.sh

# Make brightnessctl executable
sudo chmod +s $(which brightnessctl)

# Move i3, i3blocks and rofi config files to ~/.config
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/rofi

cp -r ./i3/* $HOME/.config/i3/
cp -r ./i3blocks/* $HOME/.config/i3blocks/
cp -r ./rofi/* $HOME/.config/rofi/
