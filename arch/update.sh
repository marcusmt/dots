#!/usr/bin/env bash

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# EZA
cargo install --locked eza

# Bat
cargo install --locked bat
