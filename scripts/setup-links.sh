#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

mkdir -p \
    "$XDG_CONFIG_HOME" \
    "$XDG_STATE_HOME"

ln -sfv "$REPO_DIR/config/"* "$XDG_CONFIG_HOME"
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
