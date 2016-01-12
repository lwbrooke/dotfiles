FROM ubuntu:15.04

RUN apt-get update -y \
    && apt-get install -y \
        git \
        python3 \
        python3-pip \
        curl \
        vim \
        cmake \
        build-essential \
        tmux

# Setup home environment
RUN useradd dev \
    && mkdir /home/dev && chown -R dev: /home/dev \
    && mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/ \
    && touch /var/shared/placeholder \
    && chown -R dev:dev /var/shared
VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev
ADD vimrc /home/dev/.vimrc
ADD vim /home/dev/.vim
ADD bashrc /home/dev/.bashrc
ADD gitconfig /home/dev/.gitconfig

# Link in shared parts of the home directory
RUN ln -s /var/shared/.ssh \
    && ln -s /var/shared/.bash_history

RUN chown -R dev: /home/dev
USER dev

RUN mkdir -p /home/dev/.vim/bundle \
    && git clone https://github.com/VundleVim/Vundle.vim.git /home/dev/.vim/bundle/Vundle.vim \ 
    && vim +PluginInstall +qall
