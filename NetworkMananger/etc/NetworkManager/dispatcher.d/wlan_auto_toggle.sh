#!/bin/sh

if [ "$1" = "enp3s0" ]; then
    case "$2" in
        up)
            nmcli radio wifi off
            ;;
        down)
            nmcli radio wifi on
            ;;
    esac
elif [ "$(nmcli -g GENERAL.STATE device show enp3s0)" = "20 (unavailable)" ]; then
    nmcli radio wifi on
fi
