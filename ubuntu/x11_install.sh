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
  "maim"
  "i3lock"
  "ksnip"
  "brightnessctl"
  "mate-polkit"
  "arandr"
  "blueman"
  "thunar"
  "tumbler"
  "feh"
  "lxappearance"
)

for ppa in "${ppa_list[@]}"; do
  sudo add-apt-repository -y "$ppa"
done

sudo apt install -y "${packages[@]}" --allow-change-held-packages

echo "Xft.dpi: 192" | tee $HOME/.Xresources
# TODO add the new commands to have the theme correctly configured
sudo sed -i "\$aGTK2_RC_FILES=\"/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc\"\nQT_STYLE_OVERRIDE=\"Adwaita-Dark\"\nGTK_THEME=\"Adwaita-dark\"" /etc/environment
