#!/bin/bash

# Install required modules
sudo apt-get install -y \
build-essential \
libbz2-dev \
libdb-dev \
libreadline-dev \
libffi-dev \
libgdbm-dev \
liblzma-dev \
libncursesw5-dev \
libsqlite3-dev \
libssl-dev \
zlib1g-dev \
uuid-dev \
tk-dev \
git

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make .bash_profile if not exists
if [ ! -e ~/.bash_profile ]; then
  touch ~/.bash_profile
fi

# Set environment variables 
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
STR="
# Begin environment variables for Homebrew
eval \$($(brew --prefix)/bin/brew shellenv)
# End environment variables for Homebrew
"
test -r ~/.bash_profile && echo "${STR}" >> ~/.bash_profile
echo "${STR}" >> ~/.profile
brew --version

# Install Ansible
brew install ansible
ansible --version

# Reload shell
exec $SHELL -l
