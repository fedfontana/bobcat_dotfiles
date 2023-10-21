#! /usr/bin/sh
FAN_SPEED=$(sensors | awk '/fan1:/ {printf("%s RPM",$2)}')

if [ "$FAN_SPEED" = "0 RPM" ]
then
    FAN_SPEED="OFF"
fi

echo "FAN: $FAN_SPEED"
