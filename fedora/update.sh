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

../common/rust-tools.sh
../common/nvim.sh
