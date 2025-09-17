#!/usr/bin/env bash

sudo pacman -Syu

# Define a single, sorted array of all packages
declare -a packages=(
  brave-bin
  gnome-themes-extra
  grim
  neovim
  overskride
  papirus-icon-theme
  pavucontrol
  qt6ct
  thunar
  ttf-hack-nerd
  feh
  tumbler
  xdg-desktop-portal-gtk
  zoxide
  ksnip
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
