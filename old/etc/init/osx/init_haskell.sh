#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
env \
BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
BOOTSTRAP_HASKELL_INSTALL_STACK=1 \
BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
sh
