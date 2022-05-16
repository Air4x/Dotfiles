#!/bin/sh
fixscreen.sh
wallpaper-set.sh

killall -q picom
while pgrep -u $UID -x picom > /dev/null ;do sleep 1; done
picom --experimental-backends &

killall -q dunst
while pgrep -u $UID -x dunst > /dev/null ;do sleep 1; done
dunst &
