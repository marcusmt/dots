#!/bin/sh

packages=(
  "hyprland"
  "wofi"
  "bluez"
  "bluez-utils"
  "qt6ct"
  "gnome-themes-extra"
  "nwg-look"
  "ttf-hack-nerd"
  "brightnessctl"
  "hyprlock"
  "waybar"
  "swaync"
  "eza"
)

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

./1password.sh
./paru.sh

paru -S "${packages[@]}"

cp -r ../hypr $HOME/.config
cp -r ../swaync $HOME/.config
cp -r ../waybar $HOME/.config
