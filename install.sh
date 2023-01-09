#!/bin/zsh

brew bundle
brew bundle --force cleanup
brew update

ruby-install ruby 2.7 --no-reinstall
asdf plugin add erlang
asdf plugin add elixir

asdf install erlang 25.0.4
asdf global erlang 25.0.4
asdf install elixir 1.13.4-otp-25
asdf global elixir 1.13.4-otp-25

# for node development
asdf plugin-add node-js
asdf install nodejs 16.5.0
asdf global nodejs 16.5.0

# for stable diffusion
asdf plugin-add python
asdf install python 3.8.4

rm -rf "$ZSH/custom/plugins/git-workflow"
git clone https://github.com/dpup/git-workflow.git "$ZSH/custom/plugins/git-workflow"
pushd "$ZSH/custom/plugins/git-workflow"
pip install -r requirements.txt
popd

cp ./git-workflow.plugin.zsh "$ZSH/custom/plugins/git-workflow/git-workflow.plugin.zsh"
sed -i '' 's/plugins=.*/plugins=(git git-workflow terraform z)/' ~/.zshrc
grep -qxF '. /usr/local/opt/asdf/libexec/asdf.sh' ~/.zshrc || echo '. /usr/local/opt/asdf/libexec/asdf.sh' >> ~/.zshrc

cp -r ./init.vim ~/.config/nvim/init.vim
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
nvim -es ./update-plugins.txt
