#!/bin/bash
vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')

if [ "$mute" = "yes" ] || [ -z "$vol" ]; then
    printf '%s mute\n' "$(printf '\U000F075F')"
elif [ "$vol" -lt 34 ]; then
    printf '%s %s%%\n' "$(printf '\U000F057F')" "$vol"
elif [ "$vol" -lt 67 ]; then
    printf '%s %s%%\n' "$(printf '\U000F0580')" "$vol"
else
    printf '%s %s%%\n' "$(printf '\U000F057E')" "$vol"
fi
