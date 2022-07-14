#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
env \
BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
GHCUP_USE_XDG_DIRS=1 \
BOOTSTRAP_HASKELL_INSTALL_STACK=1 \
BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
sh
