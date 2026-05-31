#!/usr/bin/env bash

cd $HOME/Downloads/
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
