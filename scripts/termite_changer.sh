#!/bin/sh

TERMITE_SIMLINK="$HOME/.config/termite/config"

TERMITE_DARK="$HOME/Dotfiles/termite/config.gruvbox.dark"
TERMITE_LIGHT="$HOME/Dotfiles/termite/config.gruvbox.light"

case "$1" in
    dark) 
            if [ -f $TERMITE_SIMLINK ]
            then
                rm $TERMITE_SIMLINK
                ln -s $TERMITE_DARK $TERMITE_SIMLINK
                killall -USR1 termite
            else
                ln -s $TERMITE_DARK $TERMITE_SIMLINK
                killall -USR1 termite
            fi
            notify-send 'termite_changer.sh' 'Changed theme in dark'
            break;;
    light)
            if [ -f $TERMITE_SIMLINK ]
            then
                rm $TERMITE_SIMLINK
                ln -s $TERMITE_LIGHT $TERMITE_SIMLINK
                killall -USR1 termite
            else
                ln -s $TERMITE_LIGHT $TERMITE_SIMLINK
                killall -USR1 termite
            fi
            notify-send 'termite_changer.sh' 'Changed theme in light'
            break;;
    *)
        notify-send 'termite_changer.sh' 'ERRORE: Parametro errato'
        ;;
esac

