#!/bin/sh

git clone git@github.com:makotow/dotfiles.git
cd ./dotfiles
git submodule update --init --recursive
./setup.sh
