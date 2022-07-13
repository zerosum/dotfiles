#!/usr/bin/env bash

[ "$(uname)" = "Darwin" ] && exit

source "$(dirname "$0")/common.sh"

if [[ -z $(command -v navi) ]]; then
    export BIN_DIR="$XDG_DATA_HOME"/cargo/bin
    bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
fi
