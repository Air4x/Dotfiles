#!/bin/sh
pipe0="/tmp/volumePipe0"
pipe1="/tmp/volumePipe1"

{ [ ! -p $pipe0 ] && [ ! -p $pipe1 ]; } && { mkfifo $pipe0; mkfifo $pipe1; }

sinks=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}' | wc -l)

pactl set-sink-volume @DEFAULT_SINK@ +5%

case $sinks in
    2)
        volume=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}' | tail -n 1) ;;
    1)
        volume=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}') ;;
esac
echo "$volume" >> "$pipe0" 
echo "$volume" >> "$pipe1"
exit 0
