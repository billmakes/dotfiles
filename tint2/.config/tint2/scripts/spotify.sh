#!/bin/bash
pgrep -x spotify >/dev/null || exit 0

status=$(playerctl --player=spotify status 2>/dev/null)
case "$status" in
    Playing) icon=$(printf '') ;;  # pause icon — click will pause
    Paused)  icon=$(printf '') ;;  # play icon  — click will resume
    *)       exit 0 ;;
esac

output=$(playerctl --player=spotify metadata --format '{{artist}} - {{title}}' 2>/dev/null)
[ -z "$output" ] && exit 0

printf '%s %s\n' "$icon" "${output:0:40}"
