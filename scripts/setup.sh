#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

/bin/bash "$CUR_DIR/setup-apt.sh"
/bin/bash "$CUR_DIR/setup-brew.sh"
/bin/bash "$CUR_DIR/setup-asdf.sh"
/bin/bash "$CUR_DIR/setup-ghq.sh"
/bin/bash "$CUR_DIR/setup-links.sh"
/bin/zsh "$CUR_DIR/setup-zinit.sh"
