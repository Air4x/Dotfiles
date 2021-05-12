function batteryinfo
upower --dump | grep -m 1 percentage | awk '{print $2}'
end
