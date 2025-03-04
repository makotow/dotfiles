#!/usr/bin/env bash

ln -sf $(PWD)/zsh/zshenv $HOME/.zshenv
ln -sf $(PWD)/git/.gitconfig $HOME/.gitconfig
ln -sf $(PWD)/git/.gitignore_global $HOME/.gitignore_global
ln -sf $(PWD)/git/.tigrc $XDG_CONFIG_HOME/tig/.tigrc
ln -sf $(PWD)/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
