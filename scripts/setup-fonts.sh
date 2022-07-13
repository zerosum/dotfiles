#! /usr/bin/env bash

[ "$(uname)" = "Darwin" ] && exit

source "$(dirname "$0")/common.sh"

TMP_DIR_NAME=tmp$(date '+%Y%m%d%H%M%S')

### install HackGenNerd
if [[ ! -d $XDG_DATA_HOME/fonts/HackGenNerd ]]; then
    mkdir -p $CUR_DIR/$TMP_DIR_NAME
    pushd $CUR_DIR/$TMP_DIR_NAME
        hgn_version='v2.6.3'
        curl -sSLO https://github.com/yuru7/HackGen/releases/download/$hgn_version/HackGenNerd_$hgn_version.zip
        unzip HackGenNerd_$hgn_version.zip
        sudo mv HackGenNerd_$hgn_version $XDG_DATA_HOME/fonts/HackGenNerd
        fc-cache
    popd
    rm -rf $CUR_DIR/$TMP_DIR_NAME
fi
