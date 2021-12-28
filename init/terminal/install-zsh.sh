#!/usr/bin/env bash

# Install oh-my-zsh.
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins.
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/autoupdate"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/djui/alias-tips.git "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-nvm"
