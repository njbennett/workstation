#!/bin/zsh

brew bundle

ruby-install ruby 2.7

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
