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

# turn off bell
xset -b

# clipboard syncing
# autocutsel -fork &
# autocutsel -selection PRIMARY -fork &

# launch polkit
/usr/bin/lxpolkit &

# launch keyring daemon
eval $(gnome-keyring-daemon --start)

# wait for launch stumpwm and set walpaper
export WALLPAPER="/home/eh/Pictures/wallpapers/firewatch/wild-sunset.png"
sleep 5s && feh --bg-fill "$WALLPAPER" &

# launch battery notifier
/home/eh/bin/battery-notifier &> /tmp/battery-notifier-$(date +%d%m%Y-%H%M%S).log &

# launch stumpwm
exec stumpwm
