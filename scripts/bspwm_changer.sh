#!/bin/sh

BSPWM_SIMLINK="$HOME/.config/bspwm/bspwmrc"

BSPWM_LIGHT="$HOME/Dotfiles/bspwm/bspwmrc.gruvbox.light"
BSPWM_DARK="$HOME/Dotfiles/bspwm/bspwmrc.gruvbox.dark"

case "$1" in
    light)
        if [ -f $BSPWM_SIMLINK ]
        then
            rm $BSPWM_SIMLINK
            ln -s $BSPWM_LIGHT $BSPWM_SIMLINK
            bspc wm -r
            notify-send 'bspwm_changer.sh' "Changed theme on $1"
        else
            ln -s $BSPWM_LIGHT $BSPWM_SIMLINK
            bspc wm -r
            notify-send 'bspwm_changer.sh' "Changed theme on $1"
            fi;;
    dark)
        if [ -f $BSPWM_SIMLINK ]
        then
           rm $BSPWM_SIMLINK
           ln -s $BSPWM_DARK $BSPWM_SIMLINK
           bspc wm -r
           notify-send 'bspwm_changer.sh' "Changed theme on $1"
       else
           ln -s $BSPWM_DARK $BSPWM_SIMLINK
           bspc wm -r
           notify-send 'bspwm_changer.sh' "Changed theme on $1"
        fi;;
    *)
        notify-send 'bspwm_changer.sh' 'ERRORE: parametro non trovato';;
esac

