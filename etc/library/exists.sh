#!/bin/sh

exists() {
  if type $1 > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}
