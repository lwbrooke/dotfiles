#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing go..."
VERSION=1.6.2 && OS=linux && ARCH=amd64
curl -O https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local/bin -xzf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/bin/go/bin
