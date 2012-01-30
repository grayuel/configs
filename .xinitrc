#!/bin/sh

xrdb -merge ~/.Xresources

xset fp+ /usr/share/fonts/local/

xsetroot -cursor_name left_ptr

feh --bg-scale ~/docs/pics/earth.jpg &

conky &
numlockx &
mpd &
xmonad
