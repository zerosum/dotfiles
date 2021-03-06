#!/bin/bash

WORKING_DIR=$(cd $(dirname $0); pwd)

export PATH=/usr/local/bin:$PATH

### init Homebrew
if [ -z $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

for tap in $(cat $WORKING_DIR/tapfiles)
do
  [[ -z $(brew tap | grep $tap) ]] && brew tap $tap
done

for cask in $(cat $WORKING_DIR/caskfiles)
do
  [[ -z $(brew list --cask | grep $cask) ]] && brew cask install $cask --force
done

for keg in $(cat $WORKING_DIR/brewfiles)
do
  [[ -z $(brew list --formula | grep $keg) ]] && brew install $keg
done

### init zsh
ZSH_BIN=/usr/local/bin/zsh
if [[ -z $(cat /etc/shells | grep $ZSH_BIN) ]]; then
  echo $ZSH_BIN | sudo tee -a /etc/shells
fi

if [ $(echo $SHELL) != $ZSH_BIN ]; then
  chsh -s $ZSH_BIN
fi

### init coursier
if [[ $(which cs) ]]; then
cs update
else
DOT_COURSIER=$WORKING_DIR/.coursier
rm -f $DOT_COURSIER
mkdir -p $DOT_COURSIER
curl -fLo $DOT_COURSIER/cs https://git.io/coursier-cli-macos && \
    chmod +x $DOT_COURSIER/cs && \
    (xattr -d com.apple.quarantine $DOT_COURSIER/cs || true)
eval "$($DOT_COURSIER/cs setup --env)"
fi

### init rust
if [[ $(ls $HOME/.cargo/bin/rustup) ]]; then
rustup update
else
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
$HOME/.cargo/bin/cargo install wasm-pack

### init Haskell
if [[ $(ls /usr/local/bin/stack) ]]; then
stack upgrade
else
curl -sSL https://get.haskellstack.org/ | sh
fi

### init anyenv
if [[ -d "$HOME/.anyenv" ]]; then
  cd "$HOME/.anyenv"
  git pull
  cd -
else
  git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

export PATH="$HOME/.anyenv/bin:$PATH"
[[ ! -e ~/.config/anyenv ]] && anyenv install --init

mkdir -p $(anyenv root)/plugins
[[ ! -d $(anyenv root)/plugins/anyenv-update ]] && \
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

anyenv install --skip-existing nodenv
anyenv update
