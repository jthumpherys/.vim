#!/usr/bin/env bash

printf "\nif [ -f \$HOME/config/.profile ]; then\n  source \$HOME/config/.profile\nfi\n\n" \
  >> $HOME/.bashrc

source $HOME/.bashrc

