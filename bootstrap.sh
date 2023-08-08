# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nat/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install asdf
git clone "https://github.com/asdf-vm/asdf.git" "~/.asdf" --branch "v0.12.0"

# for backwards compatibility
softwareupdate --install-rosetta
