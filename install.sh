#!/bin/zsh

sed -i '' 's/plugins=.*/plugins=(asdf git z)/' ~/.zshrc

brew bundle -v
brew bundle --force cleanup
brew update

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.16.1
asdf global nodejs 18.16.1

npm install -g @lydell/elm elm-test elm-format @elm-tooling/elm-language-server

asdf plugin-add elm-format https://github.com/mariohuizar/asdf-elm-format.git
asdf install elm-format 0.8.4
asdf global elm-format 0.8.4

asdf plugin-add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.19.11
asdf global golang 1.19.11

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1.5
asdf global lua 5.1.5

mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
