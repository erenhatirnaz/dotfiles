#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set dpi
xrandr --dpi 96

# load .Xresources
xrdb -merge $HOME/.Xresources

# brightness
# xbacklight -set 55% &

# turn off bell
xset -b

# set keyboard repeat rate
xset r rate 350 35

# set keyboard model and layot
# remap caps lock to ctrl key
setxkbmap -model pc105+inet -layout tr -option ctrl:nocaps

# disable touchpad when typing
syndaemon -dti1

# clipboard syncing
# autocutsel -fork &
# autocutsel -selection PRIMARY -fork &

# launch polkit
/usr/bin/lxpolkit &

# launch keyring daemon
eval $(gnome-keyring-daemon --start)

# launch stumpwm
exec stumpwm
