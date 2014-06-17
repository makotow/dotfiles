#!/usr/bin/env zsh

set -x

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sF "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
