#!/bin/sh

Choice=$(echo -e "toggle\nplay\npause\nnext\nprev\nncmpcpp" | rofi -dmenu -columns 2 -lines 3)

if [ $Choice == "ncmpcpp" ]
then
   alacritty --class float --title float -e ncmpcpp
else
    mpc $Choice
fi
