#!/bin/sh

fixscreen.sh
xsetroot -cursor_name left_ptr
wallpaper-set.sh

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
picom --experimental-backends &


killall -q dunst
while pgrep -u $UID -x dunst > /dev/null
do
    sleep 2
done
dunst &

killall -q kdeconnectd
while pgrep -u $UID -x kdeconnectd > /dev/null
do
    sleep 2
done
/usr/lib/kdeconnectd &

killall -q blueman-applet
while pgrep -u $UID -x blueman-applet > /dev/null
do
    sleep 2
done
blueman-applet &
