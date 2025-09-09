#!/usr/bin/env bash

sudo pacman -Syu

# Define a single, sorted array of all packages
declare -a packages=(
  bat
  brave-bin
  cliphist
  eza
  fish
  fzf
  ghostty-git
  gnome-themes-extra
  grim
  hypridle
  hyprlock
  hyprpolkitagent
  jq
  nvim
  otf-font-awesome
  overskride
  papirus-icon-theme
  pwvucontrol
  qt5-wayland
  qt5ct
  qt6-wayland
  qt6ct
  ripgrep
  slurp
  swappy
  swaybg
  swaync
  swayosd
  thunar
  wl-clip-persist
  wl-clipboard
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

# Remove unwanted packages
paru -R micro cachyos-micro-settings pavucontrol

echo "Instalação concluída!"
