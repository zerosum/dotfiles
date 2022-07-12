#! /usr/bin/env bash

INSTALL_DIR="${INSTALL_DIR:-$HOME/.dotfiles}"

if [ -d "$INSTALL_DIR" ]; then
    git -C "$INSTALL_DIR" pull
else
    git clone https://github.com/zerosum/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.sh"
