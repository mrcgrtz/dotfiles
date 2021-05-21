#!/bin/bash

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins.
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/djui/alias-tips.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips"

# Install the Pure prompt.
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
