#!/bin/sh

exists() {
  if type $1 > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)

output_red() {
  echo ${RED}
}

output_green() {
  echo ${GREEN}
}

output_yellow() {
  echo ${YELLOW}
}

output_white() {
  echo ${NORMAL}
}
