#!/bin/sh

packages-x11=(
  "nwg-look"
  "i3"
  "plasma-x11-session"
  "dunst"
  "picom"
  "feh"
)

packages-wayland=(
  "hypridle"
  "hyprlock"
  "wl-clip-persist"
  "grim"
  "slurp"
  "xwaylandvideobridge-git"
  "xdg-desktop-portal-hyprland"
  "swaybg"
  "swaync"
  "waybar"
  "swayosd-git"
  "qt5-wayland"
  "qt6-wayland"
  
)

packages-common=(
  "qt6ct"
  "gnome-themes-extra"
  "ttf-hack-nerd"
  "brightnessctl"
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
