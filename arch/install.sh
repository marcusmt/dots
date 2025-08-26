#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S git

# Define a single, sorted array of all packages
declare -a packages=(
  brightnessctl
  eza
  ghostty-git
  google-chrome
  gnome-themes-extra
  grim
  hypridle
  hyprland
  hyprlock
  hyprshot
  neovim
  qt5-wayland
  qt6-wayland
  qt6ct
  slurp
  swaybg
  swaync
  swayosd-git
  ttf-hack-nerd
  waybar
  wl-clip-persist
  wlogout
  wofi
  xdg-desktop-portal-hyprland
)

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# TODO add paru and 1password build

# Install packages with paru
paru -S "${packages[@]}" --noconfirm

systemctl start swayosd-libinput-backend.service

# Copy configuration files
cp -r ../hypr $HOME/.config
cp -r ../swaync $HOME/.config
cp -r ../waybar $HOME/.config
cp -r ../wofi $HOME/.config
cp -r ../fish $HOME/.config
sudo cp xdg-desktop-portal-hyprland /usr/share/xdg-desktop-portal/

echo "Instalação concluída!"
