#!/bin/sh

lower() {
    if [ $# -eq 0 ]; then
        cat <&0
    elif [ $# -eq 1 ]; then
        if [ -f "$1" -a -r "$1" ]; then
            cat "$1"
        else
            echo "$1"
        fi
    else
        return 1
    fi | tr "[:upper:]" "[:lower:]"
}

ostype() {
    # shellcheck disable=SC2119
    uname | lower
}


os_detect() {
  export PLATFORM
  case "$(ostype)" in
      *'linux'*)  echo 'linux'   ;;
      *'darwin'*) echo 'osx'     ;;
      *'bsd'*)    echo 'bsd'     ;;
      *)          echo 'unknown' ;;
  esac
}

install_git() {
  OS=`os_detect`

  if [ ${OS} == 'osx' ]; then
    brew update
    brew install git
  elif [ ${OS} == 'linux' ]; then
    echo 'Install git'
    sudo apt-get update
    sudo apt-get install -y git
  fi
}

if ! type git > /dev/null 2>&1; then
  install_git
fi

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
