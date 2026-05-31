#!/usr/bin/env bash
mkdir ~/.zsh

curl -sS https://starship.rs/install.sh | sh -s -- -y
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
cargo install --locked eza bat ripgrep

git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.zsh/you-should-use
