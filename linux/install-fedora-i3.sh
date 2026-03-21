#!/usr/bin/env bash

packages=(
  "git"
  "fish"
  "alacritty"
  "picom"
  "rofi"
  "iwl*-firmware"
  "i3"
  "feh"
  "alsa-sof-firmware"
  "nmtui"
  "alacritty"
  "arandr"
  "mate-polkit"
  "pavucontrol"
  "adw-gtk3-theme"
  "maim"
  "ksnip"
  "7zip"
  "fd"
  "xclip"
  "thunar"
  "neovim"
  "fzf"
)

sudo dnf update -y && sudo dnf upgrade -y
sudo dnf install -y "${packages[@]}"

./install.sh
./update.sh

cp -r ../alacritty ~/.config/
cp -r i3-setup/dunst ~/.config/
cp -r ../fish ~/.config/
cp -r i3-setup/i3 ~/.config/
cp -r i3-setup/picom ~/.config/
cp -r i3-setup/rofi ~/.config/
cp -r yazi ~/.config/
