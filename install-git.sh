#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring git..."

cp ./gitconfig ~/.gitconfig
ln -s $PWD/git-prompt.sh ~/.git-prompt.sh
