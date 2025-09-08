#!/usr/bin/env bash

profile="$(powerprofilesctl get)"

if [[ "$profile" == "balanced" || -z "$profile" ]]; then
  powerprofilesctl set performance
else
  powerprofilesctl set balanced
fi

profile="$(powerprofilesctl get)"

notify-send -u "normal" -a "Power-Profile" "Changed Power Profile to $profile"
