# This is my install script for my config files.

# Update
sudo apt update

# Add Kitware’s repository for Ubuntu 22.04
wget -O - https://apt.kitware.com/keys/kitware.gpg | sudo gpg --dearmor -o /usr/share/keyrings/kitware-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main" | sudo tee /etc/apt/sources.list.d/kitware.list

# Update
sudo apt update

# Missing build dependencies
sudo apt install build-essential python3-dev

# Install latest go
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz

echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
source ~/.bashrc

# Install java 17
sudo apt install openjdk-17-jdk

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

# Install vim-gtk
sudo apt install vim-gtk -y

# Update and install CMake
sudo apt install cmake

# Move vim files to home folder
cp -r ./vim/.vimrc $HOME/

# Fix YCM plugin
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all

# Move i3, i3blocks and rofi config files to ~/.config
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/rofi

cp -r ./i3/* $HOME/.config/i3/
cp -r ./i3blocks/* $HOME/.config/i3blocks/
cp -r ./rofi/* $HOME/.config/rofi/
