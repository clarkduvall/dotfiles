#!/bin/bash

git submodule update --init --recursive

shopt -s dotglob
cp -r files/* ~/.

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

vim +PluginInstall +qall
