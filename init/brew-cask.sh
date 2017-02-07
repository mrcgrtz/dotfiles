#!/usr/bin/env bash

# Maintenance
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Development
brew cask install atom
brew cask install sublime-text
brew cask install transmit
brew cask install mamp
brew cask install android-studio
brew cask install hyper

# Design
brew cask install sketch
brew cask install xscope
brew cask install invisionsync
brew cask install zeplin
brew cask install imageoptim
brew cask install imagealpha
brew cask install paintbrush

# Git
brew cask install github-desktop
brew cask install sourcetree

# Browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefoxdeveloperedition
brew cask install safari-technology-preview
brew cask install webkit-nightly
brew cask install opera-beta

# Chat
brew cask install franz
brew cask install zoomus
brew cask install skype

# Media
brew cask install spotify
brew cask install lastfm
brew cask install vlc

# Security
brew cask install tunnelblick
brew cask install little-snitch
brew cask install micro-snitch
brew cask install skype

# Quicklook
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json

# Misc.
brew cask install alfred
brew cask install virtualbox
brew cask install flux
brew cask install kap
brew cask install ubersicht
brew cask install the-unarchiver
brew cask install timemachineeditor
brew cask install dropbox
brew cask install google-drive
brew cask install a-better-finder-rename
