#!/bin/sh

# default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER="librewolf"

# clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# make java apps work on sway
export _JAVA_AWT_WM_NONREPARENTING=1

# add ~/.local/bin and ~/.config/emacs/bin to path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin" ] ; then
    PATH="$HOME/.config/emacs/bin:$PATH"
fi

export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=qt6ct
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
fi
