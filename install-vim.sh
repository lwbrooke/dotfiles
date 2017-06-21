#!/usr/bin/env bash

# !!! requires root !!!

set -e

echo "Installing apt packages..."
apt-get update -y
apt-get install -y --no-install-recommends \
    libncurses5-dev \
    libx11-dev \
    libxt-dev

echo "Installing vim..."
git clone https://github.com/vim/vim.git ~/git/vim/
CUR_DIR=$PWD
cd ~/git/vim/
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope \
            --with-x \
            --with-compiledby="Logan Brooke" \
            --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
make install
vim --version
cd $CUR_DIR

echo "Configuring vim..."
ln ./vimrc ~/.vimrc
cp -r ./vim ~/.vim

echo "Installing vim plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
CUR_DIR=$PWD
cd ~/.vim/bundle/YouCompleteMe
export PATH=$PATH:/usr/local/go/bin
python3 install.py --racer-completer --tern-completer --gocode-completer --clang-completer
cd $CUR_DIR
