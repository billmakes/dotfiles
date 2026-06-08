#!/bin/bash
icon=$(printf '\ue266')
mem=$(free -h --si | awk '/^Mem:/ { printf "%s / %s", $3, $7 }')
printf '%s %s\n' "$icon" "$mem"
