#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring git..."

cat ./gitconfig >> ~/.gitconfig
ln ./git-prompt.sh ~/.git-prompt.sh
