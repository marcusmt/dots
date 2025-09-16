#!/usr/bin/env bash

sudo pacman -Syu

# Define a single, sorted array of all packages
declare -a packages=(
  brave-bin
  cliphist
  gnome-themes-extra
  grim
  hyprland-qt-support
  hyprpolkitagent
  neovim
  overskride
  papirus-icon-theme
  pwvucontrol
  qt5-wayland
  qt6-wayland
  qt6ct
  swappy
  swaylock
  swaync
  swayosd
  thunar
  tumbler
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  waybar
  wofi
  wl-clip-persist
  zoxide
)

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zed
curl -f https://zed.dev/install.sh | sh

# Install packages with paru
paru -S --needed --noconfirm "${packages[@]}"

#LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

./1password.sh

./dots.sh

echo "Instalação concluída!"
