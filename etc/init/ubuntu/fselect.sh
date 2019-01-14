#!/bin/sh

wget "https://github.com/jhspetersson/fselect/releases/download/0.5.2/fselect-x86_64-linux-musl.gz"
gunzip fselect-x86_64-linux-musl.gz
chmod +x fselect-x86_64-linux-musl
mv fselect-x86_64-linux-musl ~/bin/fselect
