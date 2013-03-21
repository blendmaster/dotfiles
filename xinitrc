#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# FIXME xprofile doesn't seem to run properly with startxfce,
# maybe because X isn't started before it
echo source xprofile...
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile


# caps lock -> escape
setxkbmap -option caps:escape

exec startxfce4
