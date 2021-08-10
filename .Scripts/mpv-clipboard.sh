#!/bin/sh

url=$(xclip -o -selection clipboard | rofi -dmenu)

mpv $url
