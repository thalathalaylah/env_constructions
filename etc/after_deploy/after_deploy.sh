#!/bin/sh

SCRIPTPATH=$(dirname $0)

# install ruby
fish -c "anyenv install -s rbenv"
fish -c "rbenv install -s 2.6.0"
fish -c "rbenv global 2.6.0"

# install python
fish -c "anyenv install -s pyenv"
fish -c "pyenv install -s 3.6.8"
fish -c "pyenv install -s 3.7.2"
fish -c "pyenv global 3.7.2"

# install node
fish -c "anyenv install -s nodenv"
fish -c "nodenv install -s 10.15.0" # LTS
fish -c "nodenv global 10.15.0"
