#!/bin/sh

if [ -z "$ROOT_PASSWORD" ]; then
  echo 'Require root password'
  sudo -S echo 'Root password accepted'
fi
