export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
   exec dbus-run-session sway
fi
