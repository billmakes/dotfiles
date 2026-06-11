#!/bin/sh
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

polybar left &
sleep 0.5
polybar right &
