#!/bin/sh

NVIM_ON_REPO="$HOME/Dotfiles/nvim/init.vim"
NVIM_ON_HOST="$HOME/.config/nvim/init.vim"

case "$1" in
    dark)
        sed -i "s/light/dark/" $NVIM_ON_REPO
        sed -i "s/light/dark/" $NVIM_ON_HOST
        notify-send 'nvim_changer.sh' "Neovim colorscheme changed to $1"
        ;;
    light)
        sed -i "s/dark/light/" $NVIM_ON_REPO
        sed -i "s/dark/light/" $NVIM_ON_HOST
        notify-send 'nvim_changer' "Neovim colorscheme changed to $1"
        ;;
    *)
        notify-send 'nvim_changer' "ERRORE: prametro non trovato"
esac
