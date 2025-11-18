#!/usr/bin/env bash
set -e

./x11_install.sh
./picom.sh
./dunst.sh

cd ../dwm
sudo make install

cd ../dwm-bar
sudo make install

mkdir $HOME/.dwm
cp ../autostart.sh $HOME/.dwm

sudo mkdir -p /usr/share/xsessions
cat <<EOF | sudo tee /usr/share/xsessions/dwm.desktop >/dev/null
[Desktop Entry]
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Type=XSession
EOF

cp -r ../picom $HOME/.config/
cp -r ../rofi $HOME/.config/
cp -r ../dunst $HOME/.config/
cp -r ../scripts/* $HOME/.dwm/
