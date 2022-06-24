#!/bin/bash

#
# https://brew.sh/
#

WORKING_DIR=$(cd $(dirname $0); pwd)

if [ -z $(command -v $BREW_HOME/bin/brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$($BREW_HOME/bin/brew shellenv)"

brew update

for tap in $(cat $WORKING_DIR/tapfiles)
do
  [[ -z $(brew tap | grep $tap) ]] && brew tap $tap
done

for cask in $(cat $WORKING_DIR/caskfiles)
do
  [[ -z $(brew list --cask | grep $cask) ]] && brew install --cask $cask --force
done

for keg in $(cat $WORKING_DIR/brewfiles)
do
  [[ -z $(brew list --formula | grep $keg) ]] && brew install $keg
done

brew upgrade
