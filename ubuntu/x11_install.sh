#!/bin/bash

ppa_list=(
  "papirus/papirus"
)

packages=(
  "xorg"
  "xorg-dev"
  "xbacklight"
  "xbindkeys"
  "xvkbd"
  "xinput"
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

sudo apt install -y "${packages[@]}" --allow-change-held-packages

echo "Xft.dpi: 192" | tee $HOME/.Xresources
sudo sed -i "\$aGTK_THEME=\"Adwaita-dark\"" /etc/environment
