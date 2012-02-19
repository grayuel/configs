#!/bin/sh

xrdb -merge ~/.Xresources

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR="vim"

xset fp+ /usr/share/fonts/local/

xsetroot -cursor_name left_ptr

feh --bg-scale ~/docs/pics/earth.jpg &


dropboxd &
pnmixer &

trayer --edge bottom --align right --widthtype pixel --width 240 --transparent true --alpha 255 &

conky &
numlockx &
mpd &
xmonad
