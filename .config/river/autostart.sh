#!/bin/sh

killall -q dunst
while pgrep -u $UID -x dunst > /dev/null
do
    sleep 1
done
dunst &

killall -q waybar
while pgrep -u $UID -x waybar > /dev/null
do
    sleep 1
done
waybar &

killall -q kanshi
while pgrep -u $UID -x kanshi > /dev/null
do
    sleep 1
done
kanshi &

killall -q oguri
while pgrep -u $UID -x oguri > /dev/null
do
    sleep 1
done
oguri &

killall -q nm-applet
while pgrep -u $UID -x nm-applet > /dev/null
do
    sleep 1
done
nm-applet --indicator
