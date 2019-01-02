#!/bin/sh

SCRIPTPATH=$(dirname $0)
. ${SCRIPTPATH}/../lib.sh

if [ -e fails ]; then
  echo 'Exists "fails" file. this script create same name file when test failed.'
  exit 1
fi

cat ${SCRIPTPATH}/apps | while read app_name
do
  $(exists ${app_name})
  if [ $? -ne 0 ]; then
    echo "${app_name} does not exist." >> fails
  fi
done

if [ -e fails ]; then
  output_red
  cat fails
  output_white
  rm fails
  exit 1
fi

echo 'All test passed.'
