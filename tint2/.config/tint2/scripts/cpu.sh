#!/bin/bash
icon=$(printf '')
cpu=$(vmstat 1 2 | tail -1 | awk '{printf "%d%%", 100-$15}')
printf '%s %s\n' "$icon" "$cpu"
