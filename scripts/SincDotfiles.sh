#!/bin/dash


# Copia dei file dei diversi programmi nella cartella Dotfiles nella home

## bspwm
echo "Copiando bspwm..."
cp -r ~/.config/bspwm/* ~/Dotfiles/bspwm/ && echo "\t bspwm copiato"

## sxhkd
echo "Copianfo sxhkd..."
cp -r ~/.config/sxhkd/* ~/Dotfiles/sxhkd/ && echo "\t sxhkd copiato"

## fish
echo "Copiando fish..."
cp -r ~/.config/fish/* ~/Dotfiles/fish/ && echo "\t fish copiata"

## i3
echo "Copiando i3..."
cp -r ~/.config/i3/* ~/Dotfiles/i3/ && echo "\t i3 copiato"

## 13status
echo "Copianfo i3status..."
cp -r ~/.config/i3status/* ~/Dotfiles/i3status/ && echo "\t i3status copiato"

## nvim
echo "Copiando neovim..."
cp -r ~/.config/nvim/* ~/Dotfiles/nvim/ && echo "\t neovim copiato"

## picom
echo "Copiando picom..."
cp ~/.config/picom.conf ~/Dotfiles/picom/ && echo "\t picom copiato"

## polybar
echo "Copiando polybar..."
cp -r ~/.config/polybar/* ~/Dotfiles/polybar/ && echo "\t polybar copiata"

## qtile
echo "Copiando qtile..."
cp -r ~/.config/qtile/* ~/Dotfiles/qtile/ && echo "\t qtile copiato"

## termite
echo "Copianfo termite"
cp -r ~/.config/termite/* ~/Dotfiles/termite/ && echo "\t termite copiato"

##scripts
echo "Copiando qulache script..."
cp ~/scripts/Airax-fetch_EndevourOS.sh ~/Dotfiles/scripts/ && echo "\t Airax-fetch_EndevourOS.sh copiato"
cp ~/scripts/Cpp_init ~/Dotfiles/scripts/ && echo "\t Cpp_init copiato"
cp ~/scripts/Web_init ~/Dotfiles/scripts/ && echo "\t Web_init copiato"
cp ~/scripts/asciiquarium ~/Dotfiles/scripts/ && echo "\t asciiquarium copiato"
cp ~/scripts/ridmusic ~/Dotfiles/scripts/ && echo "\t ridmusic copiato"
cp ~/scripts/SincDotfiles.sh ~/Dotfiles/scripts/ && echo "\t SincDotfiles.sh copiato"
