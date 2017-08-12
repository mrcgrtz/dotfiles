#!/usr/bin/env bash

# Install Homebrew (you need the Xcode CLI tools!)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install formulae from Brewfile
brew bundle

# Use GNU tools like sha256sum.
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Switch to using brew-installed bash as default shell.
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Remove outdated versions from the cellar.
brew cleanup
