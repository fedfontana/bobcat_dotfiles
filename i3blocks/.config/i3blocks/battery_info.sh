#!/usr/bin/sh

BATTERY_INFO=$(acpi -bi)
BATTERY_STATE=$(echo "${BATTERY_INFO}" | head -n1 | grep -wo "Full\|Charging\|Discharging")
BATTERY_POWER=$(echo "${BATTERY_INFO}" | head -n1 | grep -o '[0-9]\+%' | tr -d '%')
REMAINING=$(echo "${BATTERY_INFO}" | head -n1 | awk '/remaining/ {printf("%s %s", $(NF-1), $NF)}')
BATTERY_MAX_CAP=$(echo "${BATTERY_INFO}" | tail -n1 | awk '/last full capacity/ { print $NF }')


BATTERY_STATE_INICATOR=""
if [[ "${BATTERY_STATE}" = "Charging" ]]; then
     BATTERY_STATE_INDICATOR="+"
elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
     BATTERY_STATE_INDICATOR="-"
fi

echo "BAT: $BATTERY_POWER%$BATTERY_STATE_INDICATOR, $REMAINING (MAX: $BATTERY_MAX_CAP)"

