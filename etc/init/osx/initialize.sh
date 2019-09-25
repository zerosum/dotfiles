#!/bin/bash

WORKING_DIR=$(cd $(dirname $0); pwd)

if [ -z $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

cat $WORKING_DIR/caskfiles | xargs brew cask install
cat $WORKING_DIR/brewfiles | xargs brew install

ZSH_BIN=/usr/local/bin/zsh
if [ -z $(cat /etc/shells | grep $ZSH_BIN) ]; then
  echo $ZSH_BIN | sudo tee -a /etc/shells
fi

if [ $(echo $SHELL) != $ZSH_BIN ]; then
  chsh -s $ZSH_BIN
fi
