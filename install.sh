#!/usr/bin/env zsh
emulate -LR zsh

dot_dir=${0:a:h}
subdirs=$(ls "$dot_dir")
if (($subdirs[(Ie)$HOSTNAME])); then
  local_package=$HOSTNAME
else
  local_package="generic"
fi

"$(stow --dir="$dot_dir" --no-folding --target "$HOME" --restow common "$local_package")"
