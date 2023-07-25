#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.16.1
asdf global nodjs 18.16.1

asdf plugin-add elm https://github.com/asdf-community/asdf-elm.git
asdf install elm 0.19.1
asdf global elm 0.19.1

asdf plugin-add elm-format https://github.com/mariohuizar/asdf-elm-format.git
asdf install elm-format 0.8.4
asdf global elm-format 0.8.4

asdf plugin-add go https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.19.11
asdf global golang 1.19.11

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1.5
asdf global lua 5.1.5

sed -i '' 's/plugins=.*/plugins=(git z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
