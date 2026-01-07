#!/usr/bin/env bash

# 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si
cd ..
rm -rf 1password

packages=(
  "ttf-hack-nerd"
  "fish"
  "neovim"
  "hyprpolkitagent"
  "alacritty"
  "wl-clipboard"
  "xdg-desktop-portal-hyprland"
  "xdg-desktop-portal-lxqt"
  "hyprland"
  "noctalia-shell"
  "qt6ct"
  "qt5ct"
  "qt5-wayland"
  "qt6-wayland"
  "nwg-look"
  "gnome-themes-extra"
)

paru -S "${packages[@]}"

