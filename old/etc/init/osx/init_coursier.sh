#!/bin/bash

WORKING_DIR=$(cd $(dirname $0); pwd)

if [[ $(command -v cs) ]]; then
  cs update
else
  DOT_COURSIER=$WORKING_DIR/.coursier
  rm -f $DOT_COURSIER
  mkdir -p $DOT_COURSIER
  cd $DOT_COURSIER
  curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-apple-darwin.gz | gzip -d > cs
  chmod +x cs
  eval "$($DOT_COURSIER/cs setup --env)"
fi
