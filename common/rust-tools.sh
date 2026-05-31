#!/usr/bin/env bash

if ! command -v cargo &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"
fi

command -v eza  &>/dev/null || cargo install --locked eza
command -v bat  &>/dev/null || cargo install --locked bat
command -v rg   &>/dev/null || cargo install --locked ripgrep
command -v fd   &>/dev/null || cargo install --locked fd-find
