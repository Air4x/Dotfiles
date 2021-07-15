#!/bin/sh

ChemWallpaper &

killall -q nm-applet
while pgrep -u $UID -x nm-applet > /dev/null
do
    sleep 2
done

nm-applet &

killall -q picom
while pgrep -u $UID -x picom > /dev/null
do
    sleep 2
done
picom &


killall -q dunst
while pgrep -u $UID -x dunst > /dev/null
do
    sleep 2
done
dunst &
