#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='alacritty'

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

# prompt
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# rust
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

# Man pages
export MANPAGER='nvim +Man!'

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"

# Minecraft (Prism Launcher)
export MC_PRISM="$HOME/.var/app/org.prismlauncher.PrismLauncher"
export MC_PRISM_INST="$MC_PRISM/data/PrismLauncher/instances"
export MC_PRISM_1_21="$MC_PRISM_INST/1.21/.minecraft"
export MC_PRISM_LATEST="$MC_PRISM_1_21"

# fzf Catppuccin Mocha theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Personal
export SCRIPTS="$XDG_CONFIG_HOME/scripts"
export WORKSPACE="$HOME/Workspace"
export PROJ_PERSO="$WORKSPACE/personal"
export PROJ_WORK="$WORKSPACE/work"
