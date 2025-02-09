#!/bin/sh
exec swww-daemon &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec gammastep-indicator -l 0:0 &
