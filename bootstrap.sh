#!/usr/bin/env sh

cd "$(dirname "$0")" || exit 1

doIt() {
  git pull origin main
  rsync --exclude ".git/" --exclude ".github/" --exclude "init/" --exclude "bin/" \
    --exclude ".DS_Store" --exclude ".editorconfig" \
    --exclude ".gitignore" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "LICENSE.md" -avh --no-perms . ~
  # . "$HOME/.zshrc"
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
  doIt
else
  # Homebrew
  printf "🍺  Install Homebrew and its formulae? (y/N) "
  read -r runswitch
  case "$runswitch" in
    y|Y|yes|YES) . init/brew/install-brew-formulae.sh ;;
    *) echo "Skipping Homebrew." ;;
  esac

  # dotfiles
  printf "🚨  Installing dotfiles. This will overwrite existing files in your home directory. Are you sure? (y/N) "
  read -r runswitch
  case "$runswitch" in
    y|Y|yes|YES) doIt ;;
    *) echo "Skipping installation." ;;
  esac

  # zsh
  printf "🙃  Install ohmyzsh and some plugins? (y/N) "
  read -r runswitch
  case "$runswitch" in
    y|Y|yes|YES) . init/terminal/install-zsh.sh ;;
    *) echo "Skipping ohmyzsh." ;;
  esac

  # Node modules
  printf "🟨  Install Node modules? (y/N) "
  read -r runswitch
  case "$runswitch" in
    y|Y|yes|YES) . init/npm/install-node-modules.sh ;;
    *) echo "Skipping Node modules." ;;
  esac
fi

unset doIt
