#!/bin/sh
killall -q tint2
while pgrep -x tint2 >/dev/null; do sleep 0.1; done
"$(dirname "$0")/generate.sh"
tint2 -c ~/.config/tint2/tint2rc &
