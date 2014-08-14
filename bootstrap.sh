#!/bin/bash

set -e
if [[ ! -x /usr/bin/gcc ]]; then
  echo "info | install | xcode"
  xcode-select --isntall
fi

if [[ ! -x /usr/local/bin/brew ]]; then
  echo "info | install | brew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

export PATH=/usr/local/bin:$PATH

if [[ ! -x /usr/local/bin/git ]]; then
  echo "info | install | git"
  brew install git
fi

if [[ ! -x /usr/local/bin/hg ]]; then
  echo "info | install | hg"
  brew install hg
fi

if [[ ! -x /opt/X11/bin/xquartz ]]; then
  echo "info | install | xquartz"
  brew tap caskroom/cask
  brew cask install xquartz
fi
