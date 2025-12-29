#!/usr/bin/env bash

packages=(
  "alacritty"
  "fish"
  "brave-browser"
  "noctalia-shell"
  "nvidia-open-dkms"
  "rustup"
  "neovim"
)

xdg-user-dirs-update
rustup default stable

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# EZA
cargo install eza

# Bat
cargo install bat

# Ripgrep
cargo install ripgrep

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all