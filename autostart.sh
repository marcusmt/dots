#!/usr/bin/env bash

APPS=(
  "/usr/lib/polkit-1/polkitd --no-debug --log-level=notice"
  "slstatus"
  "picom"
  "pasystray"
)

for cmd in "${APPS[@]}"; do
  app=$(basename "$(echo "$cmd" | awk '{print $1}')")
  if ! pgrep -x "$app" >/dev/null; then
    $cmd &
  fi
done
