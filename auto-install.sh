#!/bin/sh

# set install directory
DOTFILES = $1
DOTFILES="."
#if [ $1 == '' ] then ;
#    $1 = "."
#end

#20120803 working
cd "$DOTFILES"
git clone https://github.com:makotow/dotfiles.git "$DOTFILES"
git submodule update --init

./setup.rb
