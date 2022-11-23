#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

/bin/bash "$CUR_DIR/setup-apt.sh"
/bin/bash "$CUR_DIR/setup-brew.sh"
/bin/bash "$CUR_DIR/setup-links.sh"
/bin/bash "$CUR_DIR/setup-asdf.sh"
/bin/bash "$CUR_DIR/setup-docker.sh"
/bin/bash "$CUR_DIR/setup-fonts.sh"
