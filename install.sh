#!/bin/zsh

ln -sf ~/workspace/workstation/.zshrc ~/.zshrc
ln -sf ~/workspace/workstation/.gitconfig ~/.gitconfig

brew bundle -v
brew bundle --force cleanup
brew update

brew link --force libpq

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.16.1
asdf global nodejs 18.16.1

npm install -g @lydell/elm elm-test elm-format @elm-tooling/elm-language-server

asdf plugin-add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.19.11
asdf global golang 1.19.11

go install golang.org/x/tools/gopls@latest

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1.5
asdf global lua 5.1.5
ln -sf ~/workspace/workstation/elmmake.lua /opt/homebrew/share/luajit-2.1.0-beta3/elmmake.lua

mkdir -p ~/.config/nvim
ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --get url."git@github.com:".insteadOf "https://github.com/" || git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
