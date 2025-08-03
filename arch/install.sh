#!/bin/sh

packages=(
  "bluez"
  "bluez-utils"
  "gnome-themes-extra"
  "nwg-look"
  "ttf-hack-nerd"
  "brightnessctl"
  "network-manager-applet"
  "nm-connection-editor"
)

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

./1password.sh

paru -S "${packages[@]}"
