#!/bin/sh

install_with_repository() {
  cat ${SCRIPTPATH}/apps_with_repository | while true
  do
    read app_name
    if [ -z "$app_name" ] ; then break ; fi
    read repository
    if [ -z "$repository" ] ; then break ; fi

    sudo apt-add-repository ${repository}
  done

  sudo apt-get update

  cat ${SCRIPTPATH}/apps_with_repository | while true
  do
    read app_name
    if [ -z "$app_name" ] ; then break ; fi
    read repository
    if [ -z "$repository" ] ; then break ; fi

    sudo apt-get install -y ${app_name}
  done
}

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

install_with_repository
install
