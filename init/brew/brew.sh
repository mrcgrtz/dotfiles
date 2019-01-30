#!/usr/bin/env bash

# Install Homebrew (you need the Xcode CLI tools!)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we are using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install formulae from Brewfile.
brew bundle --file=Brewfile

# Maybe install formulae from Caskfile, too.
read -p "Also install native apps using Homebrew Casks and the Mac App Store (y/N)?" docask
case "$docask" in
  y|yes ) brew bundle --file=Caskfile;;
  * ) echo "Skipping Caskfile.";;
esac

# Use GNU tools like sha256sum.
echo "Do not forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Switch to using Brew-installed Bash as default shell.
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Remove outdated versions from the Cellar.
brew cleanup
