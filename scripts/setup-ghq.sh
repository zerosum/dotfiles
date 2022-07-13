#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
source $ASDF_DATA_DIR/asdf.sh
asdf plugin add ghq
asdf install ghq latest
asdf global ghq latest
