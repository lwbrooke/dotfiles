#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring bash aliases..."
ln -s $PWD/bashrc_aliases ~/.bashrc_aliases
echo "source ~/.bashrc_aliases" >> ~/.bashrc

echo "Adding executable scripts to $HOME/bin"
ln -s $PWD/dclean ~/bin/dclean
ln -s $PWD/pydl.sh ~/bin/pydl.sh
