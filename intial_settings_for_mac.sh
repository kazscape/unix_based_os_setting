#!/bin/bash

# Install command line tools for Xcode
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew --version

# Install Ansible
brew install ansible
ansible --version

# Reload shell
exec $SHELL -l

