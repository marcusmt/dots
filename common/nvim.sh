#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  nvim
fi

cp "$SCRIPT_DIR/../nvim/kanagawa-theme.lua" ~/.config/nvim/lua/plugins/
