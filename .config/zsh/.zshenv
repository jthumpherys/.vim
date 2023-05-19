#!/usr/bin/zsh

path=($HOME/.local/bin $path)

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export DOTREPO=$HOME/.dotfiles

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

export TMUXP_CONFIGDIR=$XDG_CONFIG_HOME/tmuxp
