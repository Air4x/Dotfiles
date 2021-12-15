#!/bin/sh

second_monitor_flag=$(xrandr -q | grep " connected" | wc | awk '{ print $1 }') 

case "$second_monitor_flag" in
    1)
	xwallpaper --output eDP-1 --zoom ~/Immagini/Wallpapers/dracula.png ;;
    2)
	xwallpaper --output eDP-1 --zoom ~/Immagini/Wallpapers/dracula.png
	xwallpaper --output HDMI-2 --zoom ~/Immagini/Wallpapers/dracula.png
	;;
esac
