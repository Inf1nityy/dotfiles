#!/bin/sh
exec swww-daemon &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
