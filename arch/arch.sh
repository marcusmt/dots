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

# Browser
curl -fsS https://dl.brave.com/install.sh | sh

# Neovim
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

# AI
curl -fsSL https://claude.ai/install.sh | bash
