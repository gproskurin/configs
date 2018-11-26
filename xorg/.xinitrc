#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/lib/X11/xinit/.Xresources
sysmodmap=/usr/local/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

export LANG="en_US.UTF-8"
export LC_CTYPE="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"

setxkbmap -layout us,ru  -option grp:caps_toggle
xset b off

#xmonad | dzen2
#xmonad
#exec awesome
#exec /usr/local/notion/bin/notion
#exec stumpwm
#exec /usr/local/ion/bin/ion3
#exec twm
#exec /usr/local/notion/bin/notion

export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad

###
