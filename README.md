This is my workstation setup script. There are many like it, but this one is mine.

Before running this script
- install Xcode by running `git` and the following the instructions.
- [create a new ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) for the workstation and add it to get,
- clone this repo and then run

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
