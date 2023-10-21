#!/bin/sh
TEMP=$(sensors | awk '/CPU:/ {print $2}')

CPU_USAGE=$(mpstat 1 1 | awk '/Average:\s*all/ {print 100 - $NF}')

echo "$CPU_USAGE $TEMP" | awk '{ printf("CPU: %s% @ %s \n"), $1, $2 }'

