#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing python apt packages..."
apt-get update -y
apt-get install -y --no-install-recommends \
    python3-dev \
    python-dev \
    python3-pip \
    python3-venv

echo "Installing python packages..."
pip3 install flake8 flake8-docstrings
