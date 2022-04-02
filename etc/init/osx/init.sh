#! /bin/bash

WORKING_DIR=$(cd $(dirname $0); pwd)

if [ -z $(command -v arch) ]; then
  softwareupdate --install-rosetta --agree-to-license
fi

/bin/bash $WORKING_DIR/init_brew.sh

/bin/bash $WORKING_DIR/init_zsh.sh

/bin/bash $WORKING_DIR/init_asdf.sh

/bin/bash $WORKING_DIR/init_coursier.sh

/bin/bash $WORKING_DIR/init_rust.sh

/bin/bash $WORKING_DIR/init_haskell.sh
