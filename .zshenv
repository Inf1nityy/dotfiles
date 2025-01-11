#!/bin/sh

# default programs
export EDITOR="nvim"
export TERMINAL="ghostty"
export TERMINAL_PROG="ghostty"
export BROWSER="librewolf"

# clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# add ~/.local/bin and ~/.config/emacs/bin to path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin" ] ; then
    PATH="$HOME/.config/emacs/bin:$PATH"
fi
