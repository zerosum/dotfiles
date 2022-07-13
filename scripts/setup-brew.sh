#!/usr/bin/env bash

[ "$(uname)" != "Darwin" ] && exit

source "$(dirname "$0")/common.sh"

if [ -z $(command -v /opt/homebrew/bin/brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

for tap in $(cat $REPO_DIR/config/brew/tapfiles)
do
  [[ -z $(brew tap | grep $tap) ]] && brew tap $tap
done

for cask in $(cat $REPO_DIR/config/brew/caskfiles)
do
  [[ -z $(brew list --cask | grep $cask) ]] && brew install --cask $cask --force
done

for keg in $(cat $REPO_DIR/config/brew/brewfiles)
do
  [[ -z $(brew list --formula | grep $keg) ]] && brew install $keg
done

brew upgrade

true
