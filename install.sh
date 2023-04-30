#!/usr/bin/env bash

CONFIG_DIR=$( dirname -- "$0" )
if [ $CONFIG_DIR = "." ]; then
  CONFIG_DIR=$( pwd )
fi

HIDDEN_FILES=$( find $CONFIG_DIR -maxdepth 1 -type f -name '.*' -exec basename {} \; )
IGNORE=('.gitignore' '.rosrc')
for FILE in $HIDDEN_FILES; do
  if [[ ! " ${IGNORE[@]} " =~ $FILE ]]; then
    echo $FILE
    ln -s $CONFIG_DIR/$FILE $HOME/$FILE
  fi
done

source $CONFIG_DIR/.bash_profile
