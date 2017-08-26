#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Configuring bash aliases..."
ln -s $PWD/bashrc_aliases ~/.bashrc_aliases
echo "source ~/.bashrc_aliases" >> ~/.bashrc
