#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing apt packages..."
apt-get update -y
apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    linux-image-extra-$(uname -r)

echo "Installing docker..."
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
apt-get update -y
apt-get purge lxc-docker
apt-cache policy docker-engine
apt-get install -y --no-install-recommends docker-engine
service docker start
docker run --rm hello-world
docker rmi hello-world
usermod -aG docker logan
systemctl enable docker
