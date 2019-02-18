#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing go..."
VERSION=1.11.5 && OS=linux && ARCH=amd64
curl -O https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
