vol=$(pactl list sinks | grep "Volume" -m 1 | awk -F "/" '{ print $2 }')
light=$(light -G)
mpv_stats=$(mpc status -f "%artist% - %title% %time%" | head -n 1)
notify-send 'Info' "Volume: $vol\nLuminosità: $light\n$mpv_stats"
