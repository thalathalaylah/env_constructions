#!/bin/sh

wget "https://github.com/motemen/ghq/releases/download/v0.8.0/ghq_linux_amd64.zip"
unzip ghq_linux_amd64.zip -d ghq
mv ghq/ghq ~/bin
rm -rf ghq
rm ghq_linux_amd64.zip

