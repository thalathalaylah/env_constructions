#!/bin/sh

cd ~/.env_constructions
if [ ! -d ".git" ]; then
  git init
  git remote add origin https://github.com/thalathalaylah/env_constructions.git
fi

git fetch origin
git checkout origin/master

