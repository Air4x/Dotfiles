function fish_greeting
    set sistema (uname -rs)
    set data_odierna (date)
    set Hostname (hostname)
    set mpd_status (mpc status | head -n 1)
    echo -e "\033[1m    SISTEMA:\033[0m $sistema"
    echo -e "\033[1m    DATA\033[0m $data_odierna"
    echo -e "\033[1m    HOSTNAME\033[0m $Hostname"
    echo -e "\033[1m    MPD\033[0m $mpd_status"
    PrintTODO.lua
   end
