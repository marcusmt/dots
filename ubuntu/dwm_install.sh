#!/usr/bin/env bash
set -e

cd ../../dwm
sudo make install

cd ../dwm-bar
sudo make install

mkdir $HOME/.dwm
cp ../../autostart.sh $HOME/.dwm

sudo mkdir -p /usr/share/xsessions
cat <<EOF | sudo tee /usr/share/xsessions/dwm.desktop >/dev/null
[Desktop Entry]
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Type=XSession
EOF
