#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing tmux..."
apt-get update -y
apt-get install -y --no-install-recommends \
    tmux

echo "Configuring tmux..."
git clone https://github.com/erikw/tmux-powerline.git ~/git/tmux-powerline/
ln ./tmux.conf ~/.tmux.conf
ln ./tmux-powerlinerc ~/.tmux-powerlinerc
