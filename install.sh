#!/bin/zsh
set -eux

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew update
arch -arm64 brew bundle
brew bundle --force cleanup

set +e
asdf plugin add erlang
asdf plugin add elixir
asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
set -e

asdf install erlang 25.2.3
asdf global erlang 25.2.3
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

asdf install lua 5.1.5
asdf global lua 5.1.5

ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
nvim -es ./update-plugins.txt

mix archive.install hex phx_new --force
