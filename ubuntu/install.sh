#!/usr/bin/env bash

ppa_list=(
  "ppa:git-core/ppa"
  "ppa:fish-shell/release-4"
)

packages=(
  "git"
  "fish"
  "fd-find"
  "ripgrep"
  "build-essential"
  "cmake"
  "curl"
)

common() {
  for ppa in "${ppa_list[@]}"; do
    sudo add-apt-repository -y "$ppa"
  done

  sudo apt update -y && sudo apt upgrade -y && sudo ubuntu-drivers install && snap-store --quit && sudo snap refresh snap-store

  sudo apt install -y "${packages[@]}" --allow-change-held-packages

  sudo snap remove firefox
  sudo apt autoremove -y

  # Rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"

  # Brave
  curl -fsS https://dl.brave.com/install.sh | sh

  # 1Password
  wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O $HOME/Downloads/1password.deb
  sudo apt -y install $HOME/Downloads/1password.deb
  rm $HOME/Downloads/1password.deb

  # FD-Find Config
  ln -s $(which fdfind) ~/.local/bin/fd

  # Nvim
  git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  rm -rf $HOME/.config/nvim/.git

  ./update.sh
}

show_help() {
  echo "Usage: $0 [option]"
  echo "Options:"
  echo "  dwm          Install the DWM environment."
  echo "  niri         Install the Niri environment."
  echo "  help         Show this help message."
}

case "$1" in
dwm)
  common
  ./dwm_install.sh
  ;;
niri)
  common
  ./niri_install
  ;;
*)
  echo -e "${RED}Error: Invalid option '$1'${NC}"
  show_help
  exit 1
  ;;
esac

exit 0
