#!/usr/bin/env bash

# Install Homebrew (you need the Xcode CLI tools!)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
	echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
	chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install everything else.
brew install ruby
brew install git
brew install git-extras
brew install git-flow
brew install nvm
brew install z
brew install maven32
brew unlink maven32 # mvn will be linked via maven-deluxe
brew install maven-deluxe
brew install lynx
brew install terminal-notifier
brew install ack
brew install rename
brew install tree
brew install thefuck
brew install httpie
brew install gnupg
brew install keybase

# Remove outdated versions from the cellar.
brew cleanup
