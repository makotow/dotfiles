#!/bin/sh

brew tap railwaycat/homebrew-emacsmacport
brew install emacs-mac --with-spacemacs-icon
brew linkapps

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

