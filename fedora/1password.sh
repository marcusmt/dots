#!/usr/bin/env bash

if ! command -v 1password &>/dev/null; then
  wget https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm -O $HOME/Downloads/1password.rpm
  sudo dnf install -y $HOME/Downloads/1password.rpm
  rm $HOME/Downloads/1password.rpm
fi

