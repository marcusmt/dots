#!/usr/bin/env bash

packages=(
  "dunst"
  "picom"
  "rofi"
  "rio-git"
  "arandr"
  "ttf-hack-nerd"
  "neovim"
  "gnome-themes-extra"
  "papirus-icon-theme"
  "zoxide"
  "feh"
)

paru -S "${packages[@]}"

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# 1Password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si
cd ..
rm -rf 1password

# Nvim
git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

cp -r fish $HOME/.config/
cp -r ../rio/ $HOME/.config/
./dwm_install.sh
