#xrandr --output LVDS1 --off
#xrandr --output HDMI2 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI3 --mode 1920x1200 --left-of HDMI2
#/etc/rc.d/synergys restart
#/usr/bin/vendor_perl/clipbored
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
#xrdb ~/.Xresources
/usr/bin/vmware-user-suid-wrapper
#exec /usr/bin/i3
export XDG_CURRENT_DESKTOP=Budgie:GNOME
exec budgie-desktop
