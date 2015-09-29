#Setup dual screens
xrandr --output HDMI-0 --auto --left-of DVI-I-1 --rotate left --output DVI-I-1 --auto

#turn off power save mode
xset - dpms

#merge configs for urxvt
xrdb -merge ~/.Xresources

#reinitialize last background settings
sh ~/.fehbg &

#start i3 wm
exec i3
