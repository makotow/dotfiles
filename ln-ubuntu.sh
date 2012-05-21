#!/bin/sh
 
ln -s $(pwd)/emacs/dot.emacs.d ~/.emacs.d
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/zsh/.oh-my-zsh ~/.oh-my-zsh
echo "SETUP DONE"
