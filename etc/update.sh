#!/bin/sh

SCRIPTPATH=$(dirname $0)
. ${SCRIPTPATH}/library/lib.sh

if ! type git > /dev/null 2>&1; then
  output_red
  echo '[error] This script requires git.'
  output_white
  exit 1
fi

cd ~/.env_constructions
if [ ! -d ".git" ]; then
  git init
  git remote add origin https://github.com/thalathalaylah/env_constructions.git
  git fetch origin
  git checkout --force origin/master
else
  git fetch origin
  git checkout origin/master
fi
