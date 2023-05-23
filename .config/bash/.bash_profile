# ~/.bash_profile: user-specific bash settings to be executed by bash(1) on startup.

# ensure .bashrc is sourced in login shells
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

export XDG_DATA_HOME="$HOME/.config"

export GTK_IM_MODULE=xim

export EDITOR="nvim"
export VISUAL="nvim"

set -o vi

