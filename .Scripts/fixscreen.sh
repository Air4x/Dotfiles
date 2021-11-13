#!/bin/sh
state=$(xrandr -q | grep " connected" | wc | awk '{print $1}')
case $state in
    2)
        xrandr --output eDP-1 --below HDMI-2  --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal
        ;;
    1)
	xrandr --output eDP-1 --primary
        ;;
esac

