#!/usr/bin/env bash

sudo apt install libadwaita-1-dev gettext libdbus-1-dev pkg-config

cd $HOME/Downloads

cd Downloads/

git clone https://github.com/kaii-lb/overskride && cd overskride
meson setup build && cd build
meson compile && meson devenv
mkdir -p ~/.local/share/glib-2.0/schemas
cp ../data/io.github.kaii_lb.Overskride.gschema.xml ~/.local/share/glib-2.0/schemas
glib-compile-schemas ~/.local/share/glib-2.0/schemas
