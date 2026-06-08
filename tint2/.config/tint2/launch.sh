#!/bin/sh
killall -q tint2
while pgrep -x tint2 >/dev/null; do sleep 0.1; done
tint2 -c ~/.config/tint2/tint2rc &
