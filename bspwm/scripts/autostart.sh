#!/bin/sh

#launching polybar by the script from https://github.com/adi1090x/polybar-themes
~/.config/polybar/launch.sh

## sxhkd
#killing sxhkd
killall -q sxhkd
#waiting until the process has been shut down
while pgrep -u $UID -x sxhkd > /dev/null 
do
    sleep 1
done
#launching sxhkd
sxhkd &

## nm-applet 
#killing nm-applet
killall -q nm-applet
#waiting until the process has been shut down
while pgrep -u $UID -x nm-applet > /dev/null 
do
    sleep 1 
done
#launching nm-applet
nm-applet &

## picom
#killing picom
killall -q picom
#waiting until the process has been shut down
while pgrep -u $UID -x picom > /dev/null 
do 
    sleep 1 
done
#launching picom
picom &

## emacs as a server
#killing emacs
killall -q emacs
#waiting until the process has been shut down
while pgrep -u $UID -x emacs > /dev/null
do
    sleep 1
done
#launching emacs
emacs --bg-deamon &
