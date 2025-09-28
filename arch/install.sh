#!/usr/bin/env bash

sudo pacman -Syu

# Define a single, sorted array of all packages
declare -a packages=(
  awesome-terminal-fonts
  brave-bin
  brightnessctl
  cliphist
  gnome-themes-extra
  grim
  hypridle
  hyprlock
  hyprpolkitagent
  kvantum
  neovim
  noto-fonts
  noto-fonts-emoji
  otf-font-awesome
  overskride
  papirus-icon-theme
  pwvucontrol
  qt5-wayland
  qt5ct
  qt6-wayland
  qt6ct
  slurp
  swappy
  swaybg
  swaync
  swayosd
  thunar
  ttf-font-awesome
  tumbler
  waybar
  wl-clip-persist
  wl-clipboard
  wofi
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
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
