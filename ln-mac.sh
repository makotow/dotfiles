#!/bin/sh
 
ln -s $(PWD)/emacs/dot.emacs.d ~/.emacs.d
ln -s $(PWD)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(PWD)/vim/.vimrc ~/.vimrc
ln -s $(PWD)/zsh/.zshrc ~/.zshrc
ln -s $(PWD)/zsh/.oh-my-zsh ~/.oh-my-zsh
echo "SETUP DONE"
