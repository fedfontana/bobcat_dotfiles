SOUND_LEVEL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/front-left:/ {print $5 }')

MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '/Mute:/ {print $2=="yes"}')
if [ "$MUTED" = "0" ]
then
    SOUND_LEVEL="MUTE"
fi

echo "$SOUND_LEVEL" | awk '{ printf("VOL: %3s\n", $1) }'

