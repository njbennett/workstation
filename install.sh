#!/bin/zsh
set -eu

brew bundle
brew bundle --force cleanup
brew update

asdf plugin add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 25.2.3
asdf global erlang 25.2.3
asdf install elixir 1.14.3-otp-25
asdf global elixir 1.14.3-otp-25

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1.5
asdf global lua 5.1.5

./install-elixir-ls

sed -i '' 's/plugins=.*/plugins=(git z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

ln -sf ~/workspace/workstation/init.lua ~/.config/nvim/init.lua
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
