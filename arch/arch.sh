#!/usr/bin/env bash

sudo pacman -Syu

declare -a packages=(
  awesome-terminal-fonts
  noto-fonts
  noto-fonts-emoji
  otf-font-awesome
  woff2-font-awesome
  ttf-nerd-fonts-symbols
  ttf-nerd-fonts-symbols-mono
  ttf-hack-nerd
  rsync
  neovim
  fzf
)

paru -S --needed --noconfirm "${packages[@]}"

../common/rust-tools.sh
../common/nvim.sh
../common/claude.sh

# Browser
curl -fsS https://dl.brave.com/install.sh | sh
