#!/bin/bash
icon=$(printf '\U000F02CA')
df -P / 2>/dev/null | awk -v icon="$icon" 'NR==2 { printf "%s root %s\n", icon, $5 }'
