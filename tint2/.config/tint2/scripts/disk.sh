#!/bin/bash
icon=$(printf '\U000F02CA')
df -P / /mnt/storage 2>/dev/null | awk -v icon="$icon" '
  NR==2 { r=$5 }
  NR==3 { s=$5 }
  END   { if (s) printf "%s root %s \xe2\x80\xa2 storage %s\n", icon, r, s
          else   printf "%s root %s\n", icon, r }'
