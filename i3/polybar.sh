#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait unitl the processes have been shut down
while pgrep -x polybar >/dev/nul; do sleep 1; done

# Launch polybar
polybar top &
