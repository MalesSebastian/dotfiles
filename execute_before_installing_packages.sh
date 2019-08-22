#!/bin/bash

brew install cmake macvim
# This is recommended for MacOS, not the preinstall Vim
# I installed macvim largely to make You Complete Me work
# Clang is a dependency of that

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Gets vundle working

brew tap homebrew/cask-fonts
brew cask install font-robotomono-nerd-font
# You need to set this font on your own after it is done installing

sudo npm install -g eslint
sudo npm install -g tslint typescript
# npm is assumed to be installed

sudo pip install autopep8 flake jedi
# Pip should be installed
