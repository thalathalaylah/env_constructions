#!/bin/sh

echo 'Root privilege check.'

if [ -z "$ROOT_PASSWORD" ]; then
  sudo -n echo 'OK.'
  if [ $? -ne 0 ]; then
    echo "Root privilege check failed. If you run this script from Dockerfile, specify password by environment variables."
    echo "example: ROOT_PASSWORD='<password>' make install"
    exit 1
  fi
else
  echo $ROOT_PASSWORD | sudo -S echo 'OK.'
  if [ $? -ne 0 ]; then
    echo 'Root privilege check failed.'
    exit 1
  fi
fi
