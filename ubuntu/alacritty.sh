#!/usr/bin/env bash
set -e

SOURCE_DIR="$HOME/Downloads/alacritty_build_$(date +%s)"

if ! command -v cargo >/dev/null 2>&1 || ! command -v rustc >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

sudo apt install -y \
  cmake pkg-config libfreetype6-dev libfontconfig1-dev \
  libxcb-xfixes0-dev libxkbcommon-dev python3 libncurses-dev \
  gzip desktop-file-utils libgtk-3-bin scdoc

git clone https://github.com/alacritty/alacritty.git "$SOURCE_DIR"
cd "$SOURCE_DIR"

cargo build --release --no-default-features --features=x11
sudo cp $SOURCE_DIR/target/release/alacritty /usr/local/bin/alacritty

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null

sudo cp extra/logo/compat/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

rm -rf "$SOURCE_DIR"

echo "Alacritty installation script completed."
exit 0
