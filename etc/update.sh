#!/bin/sh

. ${DOTPATH}/etc/library/os_detect.sh
. ${DOTPATH}/etc/library/color.sh

install_git() {
  OS=`os_detect`

  if [ ${OS} == 'osx' ]; then
    brew update
    brew install git
  elif [ ${OS} == 'linux' ]; then
    echo 'Install git'
    if [ -z "$ROOT_PASSWORD" ]; then
      sudo apt-get update
      sudo apt-get install -y git
    else
      echo $ROOT_PASSWORD | sudo -S apt-get update
      echo $ROOT_PASSWORD | sudo -S apt-get install -y git
    fi
  fi
}

if ! type git > /dev/null 2>&1; then
  install_git
fi

SCRIPTPATH=$(dirname $0)

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
