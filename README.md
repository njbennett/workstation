This is my workstation setup script. There are many like it, but this one is mine.

# Usage

This script assumes you have git installed, which will require installing xcode on a new Mac.
You can install xcode by running `git` on the command line.

You don't need to install iterm2, the script will do it for you.

To set up a new workstation, clone this repo and then run

```
./bootstrap.sh
./install.sh
```

To update a workstation, run
```
./install.sh
```

Anything that should be run once and only once goes in the ./bootstrap.sh script. Right now, this is just the oh-my-zsh set up and brew itself.

Everything else goes in install.sh or the Brewfile. install.sh runs brew bundle and then any additional setup.

⚠️Warning⚠️
install.sh also cleans up Brew packages. Running this script without modification on a workstation may uninstall packages you're depending on. 

When updating ./install.sh script, I use a test && commit || revert workflow.

```
./install.sh && git add -p || git reset --hard
```

# Other Setup
Here's a checklist of the other stuff you usually like to do on a new workstation

1. [Make a new keypair for the machine and add it to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 
4. Consider trying shell and then decide against it
5. Right click on all those distracting colored squares and click "Options -> Remove from Dock"
6. Arrange Displays (search for "Displays" in settings, then click the "Arrange..." button)

## On making SSH keys
```
ssh-keygen -t ed25519 -C "nat@simplermachines.com"
cat .ssh/id_ed25519.pub | pbcopy
```
Paste that into [keys](https://github.com/settings/keys)

