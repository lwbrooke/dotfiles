#!/usr/bin/env bash

# !!! requires root !!!

# terminal colors
# background: #0E2E20
# foreground: #29E18C

set -e

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git ~/git/fonts
CUR_DIR=$PWD
cd ~/git/fonts
./install.sh
cd $CUR_DIR
echo "Fonts installed. Manual selection required in Unity Tweak Tool..."

echo "Installing Paper Theme and Icons..."
add-apt-repository -y ppa:snwh/pulp
apt-get update
apt-get install -y --no-install-recommends \
    paper-icon-theme \
    paper-gtk-theme \
    paper-cursor-theme
echo "Theme installed. Manual selection required in Unity Tweak Tool..."
