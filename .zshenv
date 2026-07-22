#!/bin/sh

# default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export TERMINAL_PROG="kitty"
export BROWSER="zen"

# clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# make java apps work on sway
export _JAVA_AWT_WM_NONREPARENTING=1

# add ~/.local/bin to path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/fzf.conf"
