#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing apt packages..."
apt-get update -y
apt-get install -y --no-install-recommends \
    ruby \
    ruby-dev
