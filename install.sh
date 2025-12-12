#!/bin/zsh
set -eux

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig
ln -sf ~/workspace/workstation/.git-authors ~/.git-authors

brew update
arch -arm64 brew bundle
brew bundle --force cleanup

# complete the install of chromedriver
xattr -d com.apple.quarantine $(which chromedriver)

mise use erlang@26.2.5.2
mise use elixir@1.17.2-otp-26
mise use lua@5.1.5
mise use nodejs@20.11.1
mise prune

mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
ln -sf ~/workspace/workstation/lazy-lock.json ~/.config/nvim/lazy-lock.json
nvim -es ./update-plugins.txt

mix archive.install hex phx_new --force

/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
pip3 install gigalixir
