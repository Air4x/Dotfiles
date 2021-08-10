#!/bin/sh
pipe0="/tmp/volumePipe0"
pipe1="/tmp/volumePipe1"

{ [ ! -p $pipe0 ] && [ ! -p $pipe1 ]; } && { mkfifo $pipe0; mkfifo $pipe1; }

sinks=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}' | wc -l)
pactl set-sink-mute @DEFAULT_SINK@ toggle

case $sinks in
    2)
        state=$(pactl list sinks | grep "Mute" | awk '{print $2}' | tail -n 1) 
        case $state in
            no)
                volume=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}' | tail -n 1)
                ;;
            yes)
                volume="Muto"
                ;;
        esac
        ;;
    1)
        state=$(pactl list sinks | grep "Mute" | awk '{print $2}') 
        case $state in
            no)
                volume=$(pactl list sinks | grep "Volume: front" | awk -F "/" '{print $2}')
                ;;
            yes)
                volume="Muto"
                ;;
        esac
        ;;
esac
echo "$volume" >> "$pipe0" 
echo "$volume" >> "$pipe1"
exit 0
