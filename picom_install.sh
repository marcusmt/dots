#!/bin/bash
set -e

SOURCE_DIR="$HOME/Downloads/picom_build_$(date +%s)"

sudo apt install -y \
    libconfig-dev libdbus-1-dev libegl-dev libev-dev \
    libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev \
    libx11-xcb-dev libxcb1-dev libxcb-composite0-dev \
    libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev \
    libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev \
    libxcb-xfixes0-dev meson ninja-build uthash-dev

git clone https://github.com/yshui/picom.git "$SOURCE_DIR"
cd "$SOURCE_DIR"

meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

rm -rf "$SOURCE_DIR"

echo "Picom installation script completed."
exit 0
