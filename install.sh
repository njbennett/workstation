#!/bin/zsh
set -eu

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 25.2.3
asdf global erlang 25.2.3
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1.5
asdf global lua 5.1.5

ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt

git config --global user.name "Nat Bennett"
git config --global user.email nat@simplermachines.com
