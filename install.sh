#!/usr/bin/env bash

CONFIG_DIR=$( dirname -- "$0" )
if [ $CONFIG_DIR = "." ]; then
  CONFIG_DIR=$( pwd )
fi

HIDDEN_FILES=$( find $CONFIG_DIR -maxdepth 1 -type f -name '.*' -exec basename {} \; )
IGNORE=('.gitignore' '.profile' '.rosrc')
for FILE in $HIDDEN_FILES; do
  if [[ ! " ${IGNORE[@]} "  =~ $FILE ]]; then
    echo $FILE
    ln -s $CONFIG_DIR/$FILE $HOME/$FILE
  fi
done

printf "\nif [ -f \$HOME/config/.profile ]; then\n  source \$HOME/config/.profile\nfi\n\n" >> $HOME/.bashrc

source $CONFIG_DIR/.profile

mkdir -p $XDG_DATA_HOME/nvim
ln -s $CONFIG_DIR/init.lua $XDG_DATA_HOME/nvim/init.lua

