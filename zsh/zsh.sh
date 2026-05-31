#!/usr/bin/env bash

if ! command -v starship &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

if ! command -v zoxide &>/dev/null; then
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

../common/rust-tools.sh

mkdir -p ~/.zsh

[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
[ -d ~/.zsh/zsh-autosuggestions ]     || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[ -d ~/.zsh/you-should-use ]          || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.zsh/you-should-use
