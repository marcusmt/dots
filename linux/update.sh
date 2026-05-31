#!/usr/bin/env bash

if ! fc-list | grep -qi "Hack Nerd Font"; then
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
  mkdir -p $HOME/.fonts
  unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
  fc-cache -fv
  rm $HOME/Downloads/Hack.zip
fi

if ! command -v starship &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

if ! command -v zoxide &>/dev/null; then
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

command -v eza   &>/dev/null || cargo install --locked eza
command -v bat   &>/dev/null || cargo install --locked bat
command -v rg    &>/dev/null || cargo install --locked ripgrep
command -v yazi  &>/dev/null || cargo install --locked yazi-fm yazi-cli

if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  nvim
fi

cp ../nvim/kanagawa-theme.lua ~/.config/nvim/lua/plugins/
