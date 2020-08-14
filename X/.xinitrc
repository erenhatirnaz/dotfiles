#!/usr/bin/env bash

# turn off bell
xset -b

# set keyboard repeat rate
xset r rate 350 35

# remap caps lock to ctrl key
setxkbmap -option ctrl:nocaps

# set background image
export WALLPAPER="${HOME}/Pictures/wallpapers/firewatch/wild-sunset.png"
feh --bg-scale $WALLPAPER

# disable touchpad when typing
syndaemon -dti1
