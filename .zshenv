#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='alacritty'
export WORKSPACE="$HOME/workspace"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# X11
export XINITRC="$XDG_CONFIG_HOME/X11/.xinitrc"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export SPACESHIP_CONFIG="$ZDOTDIR/my-spaceship.zsh"

# rust
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

# Man pages
export MANPAGER='nvim +Man!'

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"
