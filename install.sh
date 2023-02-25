#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 25.0.4
asdf global erlang 25.0.4
asdf install elixir 1.13.4-otp-25
asdf global elixir 1.13.4-otp-25

sed -i '' 's/plugins=.*/plugins=(git z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

rm ~/.config/nvim/init.lua
ln -s ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
