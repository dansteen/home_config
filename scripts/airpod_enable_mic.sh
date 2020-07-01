# this script will enable the airpod mic.  It follows the instructions here:
#https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Bluetooth/#index3h2

# yay -S ofono phonesim
# uncomment lines in /etc/ofono/phonesim.conf
sudo systemctl restart ofono

# make sure that only one phonesim is running
killall phonesim
phonesim -p 12345 /usr/share/phonesim/default.xml&
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:"true"

