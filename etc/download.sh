#!/bin/sh

logging() {
    if [ "$#" -eq 0 -o "$#" -gt 1 ]; then
        echo "Usage: <msg>"
        return 1
    fi

    local text="$1"
    printf "[$(date +%H:%M:%S)] $text"
}

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

download() {
  if [ -d "${ENV_CONSTRUCTIONS_PATH}" ]; then
    logging "$ENV_CONSTRUCTIONS_PATH: already exists"
    exit 1;
  fi

  if ! is_exists "curl" && ! is_exists "wget"; then
    logging "curl or wget required"
    exit 1;
  fi

  local tarball="https://github.com/thalathalaylah/env_constructions/archive/master.tar.gz"
  if is_exists "curl"; then
    curl -L "$tarball"
  elif is_exists "wget"; then
    wget -O - "$tarball"
  fi | tar xvz

  if [ ! -d env_constructions-master ]; then
    logging "env_constructions-master: not found"
    exit 1
  fi
  command mv -f env_constructions-master "$ENV_CONSTRUCTIONS_PATH"
}

ENV_CONSTRUCTIONS_PATH=~/.env_constructions;

download
