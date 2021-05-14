#!/bin/zsh

brew bundle

ruby-install ruby 2.7 --no-reinstall

sed -i '' 's/plugins=.*/plugins=(git,z)/' ~/.zshrc
