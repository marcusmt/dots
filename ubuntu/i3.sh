#!/usr/bin/env bash

sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm-dev libxcb-shape0-dev xutils-dev meson

cd $HOME/Downloads

git clone https://github.com/i3/i3.git

cd i3

mkdir -p build
meson setup build
meson compile -C build
sudo ninja -C build install
