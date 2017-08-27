#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing node.js..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
npm install npm -g
ln -s $PWD/tern-config ~/.tern-config
