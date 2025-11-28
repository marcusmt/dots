#!/usr/bin/env bash

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

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Nvim
git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

packages=(
  "rio-git"
  "helium-browser-bin"
  "ttf-hack-nerd"
  "neovim"
  "gnome-themes-extra"
  "papirus-icon-theme"
  "zoxide"
  "hyprpolkitagent"
)

paru -S "${packages[@]}"

curl -fsSL https://install.danklinux.com | sh

cp -r fish $HOME/.config/
cp -r ../rio/ $HOME/.config/
cp -r ../hypr/ $HOME/.config/
