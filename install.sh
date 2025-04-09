#!/bin/zsh
set -eux

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew update
arch -arm64 brew bundle
brew bundle --force cleanup

mise use erlang@25.2.3
mise use elixir@1.14.3-otp-25
mise use lua@5.1.5

mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
ln -sf ~/workspace/workstation/lazy-lock.json ~/.config/nvim/lazy-lock.json
nvim -es ./update-plugins.txt

mix archive.install hex phx_new --force

/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
pip3 install gigalixir
