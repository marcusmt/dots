#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

# Fonts
curl -fsSLo /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
mkdir -p ~/.fonts
unzip -qo /tmp/Hack.zip -d ~/.fonts
fc-cache -f

# Neovim
curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz | 
  tar --strip-components=1 -xzf - -C ~/.local/

# GTK theme
curl -fsSLo /tmp/gtk.tar.xz https://github.com/lassekongo83/adw-gtk3/releases/download/v6.4/adw-gtk3v6.4.tar.xz
mkdir -p ~/.local/share/themes
tar -xf /tmp/gtk.tar.xz -C ~/.local/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Configs
cp -r niri alacritty ~/.config/
cp fish/config.fish ~/.config/fish/
