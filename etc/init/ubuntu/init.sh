#!/bin/sh

install_with_repository() {
  cat ${SCRIPTPATH}/apps_with_repository | while true
  do
    read app_name
    if [ -z "$app_name" ] ; then break ; fi
    read repository
    if [ -z "$repository" ] ; then break ; fi

    sudo apt-add-repository -y ${repository}
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

sudo apt-get update
sudo apt-get install -y software-properties-common # to use add-apt-repository
install_with_repository
install

mkdir ~/bin
sh ${SCRIPTPATH}/ghq.sh
sh ${SCRIPTPATH}/peco.sh
sh ${SCRIPTPATH}/fselect.sh
sh ${SCRIPTPATH}/anyenv.sh
