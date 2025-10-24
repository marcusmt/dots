#!/usr/bin/env bash

/usr/libexec/polkit-mate-authentication-agent-1 &
nm-applet &
blueman-applet &
pasystray &
slstatus &
picom &
dunst &
feh --bg-fill ~/.config/i3/wallpaper.jpg &
