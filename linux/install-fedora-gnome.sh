#!/usr/bin/env bash

packages=(
  "fish"
  "neovim"
  "gnome-themes-extra"
  "fzf"
)

sudo dnf update -y && sudo dnf upgrade -y
sudo dnf install -y "${packages[@]}"

gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

./install.sh
./update.sh

cp -r ../fish ~/.config/
