#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring git..."

cp ./gitconfig ~/.gitconfig
ln ./git-prompt.sh ~/.git-prompt.sh
