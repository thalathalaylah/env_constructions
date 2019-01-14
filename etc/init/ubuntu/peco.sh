#!/bin/sh

wget "https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_386.tar.gz"
tar xzvf peco_linux_386.tar.gz
chmod +x peco_linux_386/peco
cp peco_linux_386/peco /usr/local/bin
