#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

if [[ -d "$ASDF_DATA_DIR" ]]; then
    source $ASDF_DATA_DIR/asdf.sh
    asdf update
    asdf plugin update --all
else
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR
    source $ASDF_DATA_DIR/asdf.sh
fi

asdf plugin-add direnv
asdf direnv setup --version latest
