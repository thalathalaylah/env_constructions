#!/bin/sh

install() {
  cat ${SCRIPTPATH}/apps | while read app_name;
  do
    if [ line != '' ]; then
      sudo apt-get install -y ${app_name}
    fi
  done
}

echo 'Ubuntu mode'

SCRIPTPATH=$(dirname $0)

install
