eval "$(starship init zsh)"
autoload -U colors && colors

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/mario/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

diskuse () {
    df -h | head -n 1
    df -h | grep "/dev/sda1"
    df -h | grep "/dev/sda2"
} 

batteryinfo () {
    upower --dump | grep -m 1 percentage | awk '{print $2}'
}

bspwmconf () {
    nvim ~/.config/bspwm/bspwmrc
}

greetings () {
    sistem=$(uname -rs)
    data_odierna=$(date)
    hostname=$(hostname)
    echo -e "\033[1m    SISTEMA:\033[0m $sistema"
    echo -e "\033[1m    DATA\033[0m $data_odierna"
    echo -e "\033[1m    HOSTNAME\033[0m $hostname"
    PrintTODO.lua
}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

greetings
