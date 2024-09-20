#!/bin/zsh
set -eux

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew update
arch -arm64 brew bundle
brew bundle --force cleanup

set +e
asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
set -e

asdf install lua 5.1.5
asdf global lua 5.1.5

asdf install nodejs 22.8.0
asdf global nodejs 22.8.0

mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
ln -sf ~/workspace/workstation/lazy-lock.json ~/.config/nvim/lazy-lock.json
nvim -es ./update-plugins.txt
