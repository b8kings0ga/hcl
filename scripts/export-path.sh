#!/bin/bash

# Add ../bin/ to PATH

# Add ../bin/ to PATH and update the appropriate configuration file
export PATH=$PATH:$(realpath ./bin/)
if [ -n "$ZSH_VERSION" ]; then
    echo 'export PATH=$PATH:'$(realpath ./bin/) >> ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    echo 'export PATH=$PATH:'$(realpath ./bin/) >> ~/.bashrc
fi

# Source the appropriate configuration file based on the current shell
if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
fi