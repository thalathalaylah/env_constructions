#!/bin/sh

. ${DOTPATH}/etc/library/os_detect.sh

INITPATH=$(dirname $0)
OS=`os_detect`

if [ ${OS} == 'osx' ]; then
  sh ${INITPATH}/mac/init.sh
elif [ ${OS} == 'linux' ]; then
  if [ -z "$ROOT_PASSWORD" ]; then
    sudo sh ${INITPATH}/ubuntu/init.sh
  else
    echo $ROOT_PASSWORD | sudo -S sh ${INITPATH}/ubuntu/init.sh
  fi
fi
