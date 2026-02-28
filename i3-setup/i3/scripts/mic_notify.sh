#!/bin/bash
vol_info=$(wpctl get-volume @DEFAULT_SOURCE@)

if [[ "$vol_info" == *"[MUTED]"* ]]; then
  dunstify -t 10000 -h string:x-dunst-stack-tag:mic_notif "󰍭 muted"
else
  dunstify -t 10000 -h string:x-dunst-stack-tag:mic_notif "󰍬 unmuted"
fi
