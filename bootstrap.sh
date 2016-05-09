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
