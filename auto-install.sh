#!/bin/sh

## init
./bootstrap.sh

git clone git@github.com:makotow/dotfiles.git
./dotfiles/setup.sh
