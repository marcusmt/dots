#!/bin/bash

function get_mute {
  wpctl status | grep -A 5 "Sources:" | grep "*" | grep -q "MUTED"
  if [ $? -eq 0 ]; then
    echo "true"
  else
    echo "false"
  fi
}

function show_mic_notif {
  local mic_icon
  local message
  if [ $(get_mute) == "true" ]; then
    mic_icon="󰍭"
    message="muted"
  else
    mic_icon="󰍬"
    message="unmuted"
  fi

  echo $mic_icon

  dunstify -t 10000 -h string:x-dunst-stack-tag:mic_notif -h string:value:"" "$mic_icon $message"
}

show_mic_notif