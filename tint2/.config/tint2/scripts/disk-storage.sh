#!/bin/bash
mountpoint -q /mnt/storage || exit 0
icon=$(printf '\U000F02CA')
df -P /mnt/storage 2>/dev/null | awk -v icon="$icon" 'NR==2 { printf "%s storage %s\n", icon, $5 }'
