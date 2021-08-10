#!/bin/sh

light -A 5

luce=$(light -G)

notify-send 'Luminosità' $luce --expire-time=500
