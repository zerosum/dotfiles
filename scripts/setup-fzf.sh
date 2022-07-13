#!/usr/bin/env bash

#
# https://github.com/junegunn/fzf/blob/master/install
#

source "$(dirname "$0")/common.sh"

INSTALL_DIR=$XDG_DATA_HOME/fzf
if [[ -z $(command -v fzf) ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $INSTALL_DIR
else
    git -C $INSTALL_DIR pull
fi
$INSTALL_DIR/install --all --xdg --key-bindings --completion --no-bash --no-zsh
