#!/usr/bin/env bash

packages=(
  "libxcb-cursor-dev"
)

sudo apt install -y "${packages[@]}"

curl -fsSL https://install.danklinux.com | sh
