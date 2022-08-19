#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

ruby-install ruby 2.7 --no-reinstall
asdf plugin add elixir
asdf install elixir 1.13.4-otp-25
asdf global elixir 1.13.4-otp-25

sed -i '' 's/plugins=.*/plugins=(git,z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc
