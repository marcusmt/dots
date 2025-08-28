#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S git

# Define a single, sorted array of all packages
declare -a packages=(
  ghostty
  fish
)

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install packages with paru
paru -S --needed --noconfirm "${packages[@]}"

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# TODO add paru, 1password, nvidia
./paru.sh
./1password.sh
./nvidia.sh

cp -r ../ghostty $HOME/.config/
cp -r ../fish $HOME/.config/

./cleanup.sh
echo "Instalação concluída!"
