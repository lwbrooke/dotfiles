#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring git..."

ln ./gitconfig ~/.gitconfig
ln ./git-prompt.sh ~/.git-prompt.sh
