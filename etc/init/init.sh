#!/bin/sh

lower() {
    if [ $# -eq 0 ]; then
        cat <&0
    elif [ $# -eq 1 ]; then
        if [ -f "$1" -a -r "$1" ]; then
            cat "$1"
        else
            echo "$1"
        fi
    else
        return 1
    fi | tr "[:upper:]" "[:lower:]"
}

ostype() {
    # shellcheck disable=SC2119
    uname | lower
}

os_detect() {
    export PLATFORM
    case "$(ostype)" in
        *'linux'*)  echo 'linux'   ;;
        *'darwin'*) echo 'osx'     ;;
        *'bsd'*)    echo 'bsd'     ;;
        *)          echo 'unknown' ;;
    esac
}

INITPATH=$(dirname $0)
OS=`os_detect`

if [ ${OS} == 'osx' ]; then
  sh ${INITPATH}/mac/init.sh
elif [ ${OS} == 'linux' ]; then
  sh ${INITPATH}/ubuntu/init.sh
fi
