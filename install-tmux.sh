#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing tmux..."
apt-get update -y
apt-get install -y --no-install-recommends \
    tmux

echo "Configuring tmux..."
git clone https://github.com/lwbrooke/tmux-powerline.git ~/git/tmux-powerline/
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux-powerlinerc ~/.tmux-powerlinerc
