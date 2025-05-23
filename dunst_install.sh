#!/bin/bash
set -e

SOURCE_DIR="$HOME/Downloads/dunst_build_$(date +%s)"

sudo apt install -y \
    libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev \
    libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev \
    libxdg-basedir-dev libgdk-pixbuf-2.0-dev librsvg2-dev \
    libnotify-dev

git clone https://github.com/dunst-project/dunst.git "$SOURCE_DIR"
cd "$SOURCE_DIR"

make
sudo make install

rm -rf "$SOURCE_DIR"

echo "Dunst installation script completed."
exit 0
