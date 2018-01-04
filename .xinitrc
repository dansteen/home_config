#xrandr --output LVDS1 --off
#xrandr --output HDMI2 --mode 1920x1080 --right-of LVDS1
#xrandr --output Virtual1 --mode 1920x1440 
xrandr --dpi 220
#/etc/rc.d/synergys restart
#/usr/bin/vendor_perl/clipbored
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
greenclip daemon &
#xrdb ~/.Xresources
xrdb -merge ~/.Xresources
/usr/bin/vmware-user-suid-wrapper
#export XDG_CURRENT_DESKTOP=i3:GNOME
#exec gnome-session --session=i3-gnome
#exec /usr/bin/i3-gnome
#export XDG_CURRENT_DESKTOP=i3:GNOME
#exec budgie-desktop --session=budgie-i3-desktop
#exec budgie-desktop 
/usr/bin/cinnamon-session-i3



