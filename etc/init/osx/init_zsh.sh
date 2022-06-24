#!/bin/bash

ZSH_BIN="$BREW_HOME/bin/zsh"
if [[ -z $(cat /etc/shells | grep $ZSH_BIN) ]]; then
  echo $ZSH_BIN | sudo tee -a /etc/shells
fi

if [ $(command -v zsh) != $ZSH_BIN ]; then
  chsh -s $ZSH_BIN
fi
