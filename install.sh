#!/usr/bin/env bash

# Rust - skip if already installed
if ! command -v rustc &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"
fi

# 1Password - skip if already installed
if ! command -v 1password &>/dev/null; then
  wget https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm -O $HOME/Downloads/1password.rpm
  sudo dnf install -y $HOME/Downloads/1password.rpm
  rm $HOME/Downloads/1password.rpm
fi

# Brave - skip if already installed
if ! command -v brave-browser &>/dev/null; then
  curl -fsSL https://dl.brave.com/install.sh | sh
fi

# Claude - skip if already installed
if ! command -v claude &>/dev/null; then
  curl -fsSL https://claude.ai/install.sh | bash
fi
