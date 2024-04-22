#!/bin/zsh
set -eux

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew update
brew bundle
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
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt

git config --global user.name "Nat Bennett"
git config --global user.email nat@simplermachines.com

mix archive.install hex phx_new --force
