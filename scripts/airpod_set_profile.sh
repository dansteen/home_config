# this script will toggle the profile of our airpods between a2dp and headset.

# we accept the profile you want to set
# should be one of "a2dp" and "headset"
PROFILE="$1"

AIRPOD_ADDRESS="E4:76:84:2D:7A:B2"
AIRPOD_CARD_ADDRESS="${AIRPOD_ADDRESS//:/_}"

# first make sure that we are connected
pactl list cards | grep $AIRPOD_CARD_ADDRESS > /dev/null || bluetoothctl connect $AIRPOD_ADDRESS
# if we can't connect, we don't continue
[ $? -ne 0 ] && echo "Could not connect to airpods" && exit 1

# then depending on what profile we are using we take some different actions
case $PROFILE in 
  a2dp)
    # change the profile
    pactl set-card-profile bluez_card.$AIRPOD_CARD_ADDRESS a2dp_sink
    # use this as the default device
    pactl set-default-sink bluez_sink.$AIRPOD_CARD_ADDRESS.a2dp_sink
  ;;
  headset)
    # change the profile
    pactl set-card-profile bluez_card.$AIRPOD_CARD_ADDRESS headset_head_unit
    # use this as the default device
    pactl set-default-source bluez_source.$AIRPOD_CARD_ADDRESS.headset_head_unit
    pactl set-default-sink bluez_sink.$AIRPOD_CARD_ADDRESS.headset_head_unit
  ;;
  toggle)
    # first get the current profile
    CURRENT_PROFILE="$(pactl list cards |grep $AIRPOD_CARD_ADDRESS -B1 -A25 |grep 'Active Profile' |awk '{print $3}')"
    [[ "$CURRENT_PROFILE" == "headset_head_unit" ]] && $0 a2dp
    [[ "$CURRENT_PROFILE" == "a2dp_sink" ]] && $0 headset
  ;;
  *)
    echo "Didn't recognize that option. Please choose one of headset, a2dp, and toggle"
  ;;
esac
