#!/bin/bash

ppa_list=(
  "ppa:git-core/ppa"
  "ppa:fish-shell/release-4"
  "papirus/papirus"
)

packages=(
  "git"
  "fish"
  "fd-find"
  "ripgrep"
  "build-essential"
  "cmake"
  "xorg"
  "xorg-dev"
  "xbacklight"
  "xbindkeys"
  "xvkbd"
  "xinput"
  "build-essential"
  "sxhkd"
  "xdotool"
  "dbus-x11"
  "libnotify-bin"
  "libnotify-dev"
  "libusb-0.1-4"
  "rofi"
  "pasystray"
  "pavucontrol"
  "papirus-icon-theme"
)

for ppa in "${ppa_list[@]}"; do
  sudo add-apt-repository -y "$ppa"
done

sudo apt update -y && sudo apt upgrade -y && sudo ubuntu-drivers install && snap-store --quit && sudo snap refresh snap-store

sudo apt install -y "${packages[@]}" --allow-change-held-packages

sudo snap remove firefox
sudo apt autoremove -y

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# 1Password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O $HOME/Downloads/1password.deb
sudo apt -y install $HOME/Downloads/1password.deb
rm $HOME/Downloads/1password.deb

# FD-Find Config
ln -s $(which fdfind) ~/.local/bin/fd

echo "Xft.dpi: 192" | tee $HOME/.Xresources
sudo sed -i "\$aGTK_THEME=\"Adwaita-dark\"" /etc/environment

# Nvim
git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

./update.sh
