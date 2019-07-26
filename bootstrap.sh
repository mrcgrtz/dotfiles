#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  git pull origin master;
  rsync --exclude ".git/" --exclude "init/" --exclude "bin/" \
    --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "LICENSE.md" -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "🍺  Install Homebrew and its formulae? (y/N) " dobrew
  case "$dobrew" in
    y|yes ) source init/brew/brew.sh;;
    * ) echo "Skipping Homebrew.";;
  esac
  read -p "🚨  Installing dotfiles. This will overwrite existing files in your home directory. Are you sure? (y/N) " dobrew
  case "$dobrew" in
    y|yes ) doIt;;
    * ) echo "Skipping installation.";;
  esac
fi;
unset doIt;
