#!/bin/sh

# Rotate third vertical monitor
xrandr --output DP-1-3 --rotate right

# Move it to the left of the other external monitor
xrandr --output DP-1-3 --left-of DVI-I-2-1

# Might need to reload awesome/rc.lua as well
