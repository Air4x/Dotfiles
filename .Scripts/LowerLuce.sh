#!/bin/sh

light -U 5

luce=$(light -G)

notify-send 'Luminosità' $luce --expire-time=500
