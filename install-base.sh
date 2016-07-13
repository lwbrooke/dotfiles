#!/usr/bin/env bash

# !!! requires root !!!

set -e

# packages
echo "Installing apt packages..."
apt-get update -y
apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    tree \
    locate
