#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")" || exit;

function doIt() {
  git pull origin main;
  rsync --exclude ".git/" --exclude "init/" --exclude "bin/" \
    --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "LICENSE.md" -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  # Homebrew
  read -r -p "🍺  Install Homebrew and its formulae? (y/N) " runswitch
  case "$runswitch" in
    y|yes ) source init/brew/install-brew-formulae.sh;;
    * ) echo "Skipping Homebrew.";;
  esac

  # dotfiles
  read -r -p "🚨  Installing dotfiles. This will overwrite existing files in your home directory. Are you sure? (y/N) " runswitch
  case "$runswitch" in
    y|yes ) doIt;;
    * ) echo "Skipping installation.";;
  esac

  # zsh
  read -r -p "🙃  Install ohmyzsh and some plugins? (y/N) " runswitch
  case "$runswitch" in
    y|yes ) source init/terminal/install-zsh.sh;;
    * ) echo "Skipping ohmyzsh.";;
  esac

  # Node modules
  read -r -p "❇️  Install Node modules? (y/N) " runswitch
  case "$runswitch" in
    y|yes ) source init/npm/install-node-modules.sh;;
    * ) echo "Skipping Node modules.";;
  esac
fi;
unset doIt;
